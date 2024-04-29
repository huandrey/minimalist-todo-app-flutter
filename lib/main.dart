import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mytodolist/pages/home/home_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box from hive
  var box = await Hive.openBox('todo_box');

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
          seedColor: const Color.fromRGBO(251, 192, 45, 1),
          ).copyWith(
            background: Colors.grey.shade900,
          ),
      ),
      home: const HomePage(title: 'mytodoapp'),
    );
  }
}
