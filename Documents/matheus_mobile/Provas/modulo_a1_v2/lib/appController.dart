import 'package:flutter/material.dart';
import 'package:modulo_a1_v2/pages/splashPage.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      routes: {
        '/splash': (context) => const SplashScreen()
      }, initialRoute: '/splash',
    );
  }
}