import 'package:flutter/material.dart';
import 'package:modulo_a1_emerson/pages/gamePage.dart';
import 'package:modulo_a1_emerson/pages/homePage.dart';
import 'package:modulo_a1_emerson/pages/rankingPage.dart';
import 'package:modulo_a1_emerson/pages/splashPage.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/ranking': (context) => const RankingPage(),
        '/game': (context) => const GamePage(),
      },
      initialRoute: '/splash',
    );
  }
}
