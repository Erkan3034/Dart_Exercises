import 'package:flutter/material.dart';

void main() {
  String title = "Erkan";
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'My First App',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text("Merhaba, $title!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Action Button Pressed");
          Text("Merhaba, $title!");
        },
        child: const Icon(Icons.add),
      ),
    ),
  ));
}