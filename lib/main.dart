import 'package:flutter/material.dart';
import 'package:mytodolist/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mytodoapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow.shade700,
          ).copyWith(
            background: Colors.grey.shade900,
          ),
      ),
      home: const HomePage(title: 'mytodoapp'),
    );
  }
}
