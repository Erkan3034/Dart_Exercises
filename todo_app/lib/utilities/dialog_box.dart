import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final my_controller;
  VoidCallback onSave;
  VoidCallback onCancel;

    DialogBox({
    super.key,
    required this.my_controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create New Task"),
      backgroundColor: const Color.fromARGB(255, 175, 216, 137),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: my_controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task here",
              ),
              onChanged: (value) {
                //get user input
              },
            ),
          // buttons -> save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 8), //space between buttons
              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel),

            ],
          )
       ],
        ),
      ),

    );
  }
}