import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_a1_emerson/global/variaveis.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacementNamed(context, '/home');
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Image.asset('assets/images/logomarca.png'),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _animation.value,
                    valueColor: AlwaysStoppedAnimation<Color>(corAzul),
                    minHeight: 20,
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
