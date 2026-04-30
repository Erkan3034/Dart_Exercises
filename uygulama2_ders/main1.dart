import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Text Buton'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Text Buton Iconlu'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated Buton'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Elevated Buton Iconlu'),
        ),
      ],
    ),
  ),
);
  }
}
