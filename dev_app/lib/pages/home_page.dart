import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 208, 0),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}