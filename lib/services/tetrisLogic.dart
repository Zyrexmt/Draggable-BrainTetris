import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum Tetromino { ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN }

class TetrisPiece {
  Tetromino type;
  int anchorRow;
  int anchorCol;
  List<List<int>> shape = [];
  Color? color;

  static Color _colorFor(Tetromino type) {
    switch (type) {
      case Tetromino.ONE:
        return Color.fromRGBO(102, 0, 0, 1);
      case Tetromino.TWO:
        return Color.fromRGBO(19, 80, 0, 1);
      case Tetromino.THREE:
        return Color.fromRGBO(250, 150, 0, 1);
      case Tetromino.FOUR:
        return Color.fromRGBO(0, 200, 250, 1);
      case Tetromino.FIVE:
        return Color.fromRGBO(255, 238, 0, 1);
      case Tetromino.SIX:
        return Color.fromRGBO(95, 51, 0, 1);
      case Tetromino.SEVEN:
        return Color.fromRGBO(102, 0, 0, 1);
    }
  }

  static List<List<int>> _shapeFor(Tetromino type) {
    switch (type) {
      case Tetromino.ONE:
        return [
          [0, 1],
          [1, 0],
          [1, 1],
          [1, 2],
        ];
      case Tetromino.TWO:
        return [
          [0, 1],
          [1, 0],
          [1, 1],
          [2, 0],
        ];
      case Tetromino.THREE:
        return [
          [0, 0],
          [0, 1],
          [0, 2],
          [0, 3],
        ];
      case Tetromino.FOUR:
        return [
          [0, 2],
          [1, 0],
          [1, 1],
          [1, 2],
        ];
      case Tetromino.FIVE:
        return [
          [0, 0],
          [0, 1],
          [1, 0],
          [2, 0],
        ];
      case Tetromino.SIX:
        return [
          [0, 1],
          [0, 2],
          [1, 0],
          [1, 1],
        ];
      case Tetromino.SEVEN:
        return [
          [0, 0],
          [0, 1],
          [1, 0],
          [1, 1],
        ];
    }
  }

  static int _boudingSize(Tetromino type) =>
      type == Tetromino.THREE ? 4 : 3;

  List<List<int>> rotatedSShape() {
    final n = _boudingSize(type);
    return shape.map((c) {
      final dr = c[0];
      final dc = c[1];
      return [dc, n - 1 - dr];
    }).toList();
  }

  List<int> get position => shape
      .map(
        (c) =>
            (anchorRow + c[0]) * TetrisGameProvider.colCount +
            (anchorCol + c[1]),
      )
      .toList();

  TetrisPiece(this.type)
    : color = _colorFor(type),
      shape = _shapeFor(type),
      anchorRow = 0,
      anchorCol =
          (TetrisGameProvider.colCount - _boudingSize(type)) ~/ 2;
}

class TetrisGameProvider with ChangeNotifier {
  static const int colCount = 10;
  static const int rowCount = 20;
  static int totalCells = rowCount * colCount;

  List<Color?> grid = List.generate(totalCells, (_) => null);
  TetrisPiece? currentPiece;
  int score = 0;
  bool isGameOver = false;
  Timer? _gameTimer;
  int _tickMs = 500;
  bool _fastDrop = false;

  bool _isValidPosition() {
    for (final cell in currentPiece!.shape) {
      final row = currentPiece!.anchorRow + cell[0];
      final col = currentPiece!.anchorCol + cell[1];

      if (row < 0 || row >= rowCount) return false;
      if (col < 0 || col >= colCount) return false;
      final pos = row * colCount + col;
      if (grid[pos] != null) return false;
    }
    return true;
  }

  bool _canMoveDown() {
    for (final pos in currentPiece!.position) {
      final row = pos ~/ colCount;
      if (row == rowCount - 1) return false;
      int next = pos + colCount;
      if (next >= totalCells) return false;
      if (next >= 0 && grid[next] != null) return false;
    }
    return true;
  }

  bool _canMoveHorizontal(int dir) {
    for (final pos in currentPiece!.position) {
      if (pos < 0) continue;
      if (dir == -1 && pos % colCount == 0) return false;
      if (dir == 1 && pos % colCount == colCount - 1) return false;
      int next = pos + dir;
      if (next >= 0 && next < totalCells && grid[next] != null) {
        return false;
      }
    }
    return true;
  }

  int _tickReduce() {
    final decrement = score ~/ 50;
    final ms = 500 - decrement * 100;
    return ms < 100 ? 100 : ms;
  }

  void _createNewPiece() {
    final types = Tetromino.values;
    final randomIndex = Random().nextInt(types.length);
    currentPiece = TetrisPiece(types[randomIndex]);

    if (!_isValidPosition()) {
      isGameOver = true;
      _gameTimer?.cancel();
    }
    notifyListeners();
  }

  void _startTimer(int ms) {
    _gameTimer?.cancel();
    _tickMs = ms;
    _gameTimer = Timer.periodic(Duration(milliseconds: ms), (_) {
      moveDown();
    });
  }

  void _updateSpeed() {
    if (_fastDrop) return;
    final target = _tickReduce();
    if (_tickMs != target) _startTimer(target);
  }

  void setFastDrop(bool fast) {
    _fastDrop = fast;
    final target = fast ? 100 : _tickReduce();
    if (_tickMs != target) _startTimer(target);
  }

  void _clearLines() {
    int linesClear = 0;

    for (int row = rowCount - 1; row >= 0; row--) {
      final start = row * colCount;
      final end = start + colCount;
      final isFull = grid
          .sublist(start, end)
          .every((cell) => cell != null);

      if (isFull) {
        grid.removeRange(start, end);
        grid.insertAll(0, List.generate(colCount, (_) => null));
        linesClear++;
        row++;
      }
    }
    if (linesClear > 0) {
      score += linesClear * 10;
      _updateSpeed();
    }
  }

  void _landPiece() {
    for (int pos in currentPiece!.position) {
      if (pos >= 0 && pos < totalCells) {
        grid[pos] = currentPiece!.color;
      }
    }
    _clearLines();
    _createNewPiece();
  }

  void moveDown() {
    if (currentPiece == null || isGameOver) return;
    if (_canMoveDown()) {
      currentPiece!.anchorRow++;
    } else {
      _landPiece();
    }
    notifyListeners();
  }

  void _move(int dir) {
    if (currentPiece == null || isGameOver) return;
    if (!_canMoveDown()) return;
    if (!_canMoveHorizontal(dir)) return;

    currentPiece!.anchorCol += dir;
    notifyListeners();
  }

  void moveLeft() => _move(-1);
  void moveRight() => _move(1);

  void rotate() {
    if (currentPiece == null || isGameOver) return;
    final oldCol = currentPiece!.anchorCol;
    final oldShape = currentPiece!.shape;
    currentPiece!.shape = currentPiece!.rotatedSShape();

    if (_isValidPosition()) {
      notifyListeners();
      return;
    }
    for (final offset in [1, -1, 2, -2]) {
      currentPiece!.anchorCol = oldCol + offset;
      if (_isValidPosition()) {
        notifyListeners();
        return;
      }
    }

    currentPiece!.anchorCol = oldCol;
    currentPiece!.shape = oldShape;
  }

  void startGame() {
    grid = List.generate(totalCells, (_) => null);
    score = 0;
    currentPiece = null;
    _fastDrop = false;
    isGameOver = false;
    _createNewPiece();
    _startTimer(500);
  }

  void stopGame() {
    isGameOver = true;
    _gameTimer?.cancel();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  void resetGame() {
    grid = List.generate(totalCells, (_) => null);
    currentPiece = null;
    isGameOver = false;
    score = 0;
    notifyListeners();
  }
}
