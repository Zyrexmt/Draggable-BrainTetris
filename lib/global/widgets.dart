import 'package:flutter/material.dart';
import 'package:modulo_a1_emerson/global/variaveis.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.titulo,
  });

  final VoidCallback onPressed;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: corVerde,
        foregroundColor: corPreto,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: BorderSide(color: corPreto, width: 2),
        ),
        elevation: 4,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 60),
      ),
      child: Text(
        titulo,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() =>
      _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -30 * _controller.value),
          child: child,
        );
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 40,
        itemBuilder: (context, index) =>
            Icon(Icons.grid_on, color: corPreto.withOpacity(0.1)),
      ),
    );
  }
}
