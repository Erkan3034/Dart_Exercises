import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/theme/todo_theme.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  // Init Hive database
  await Hive.initFlutter();

  // Open box
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      theme: TodoTheme.lightTheme(),
      home: const HomePage(),
    );
  }
}
