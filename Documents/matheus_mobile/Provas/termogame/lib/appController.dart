import 'package:flutter/material.dart';
import 'package:termogame/pages/gamePage.dart';
import 'package:termogame/pages/historyPage.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      routes: {
        '/init': (context) => const HomePage(),
        '/hist': (context) => const HistoryPage()
      }, initialRoute: '/init',
    );
  }
}