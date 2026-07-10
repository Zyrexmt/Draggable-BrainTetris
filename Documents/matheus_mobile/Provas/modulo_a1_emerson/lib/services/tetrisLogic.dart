import 'dart:async';
import 'dart:ui';

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
        return Color.fromRGBO(131, 0, 0, 1);
      case Tetromino.TWO:
        return Color.fromRGBO(34, 92, 0, 1);
      case Tetromino.THREE:
        return Color.fromRGBO(255, 153, 0, 1);
      case Tetromino.FOUR:
        return Color.fromRGBO(0, 204, 255, 1);
      case Tetromino.FIVE:
        return Color.fromRGBO(255, 208, 0, 1);
      case Tetromino.SIX:
        return Color.fromRGBO(114, 65, 0, 1);
      case Tetromino.SEVEN:
        return Color.fromRGBO(131, 0, 0, 1);
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
          [0, 1],
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

  List<List<int>> rotatedShape() {
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
}
