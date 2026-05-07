import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/widgets/custom_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController my_controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.my_controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: TodoConstants.borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: TodoConstants.borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              TodoConstants.backgroundColor,
              TodoConstants.accentColor.withOpacity(0.6),
            ],
          ),
        ),
        padding: EdgeInsets.all(TodoConstants.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              TodoConstants.createTaskTitle,
              style: TextStyle(
                fontSize: TodoConstants.subtitleFontSize,
                fontWeight: FontWeight.bold,
                color: TodoConstants.darkGreen,
              ),
            ),
            SizedBox(height: TodoConstants.paddingLarge),

            // Input Field
            TextField(
              controller: my_controller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: TodoConstants.taskHint,
                prefixIcon: Icon(Icons.add_task, color: TodoConstants.accentColor),
                filled: true,
                fillColor: TodoConstants.white,
                border: OutlineInputBorder(
                  borderRadius: TodoConstants.borderRadius,
                  borderSide: BorderSide(color: TodoConstants.accentColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: TodoConstants.borderRadius,
                  borderSide: BorderSide(
                    color: TodoConstants.accentColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: TodoConstants.borderRadius,
                  borderSide: BorderSide(
                    color: TodoConstants.darkGreen,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: TodoConstants.paddingLarge),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    label: TodoConstants.saveButton,
                    onPressed: onSave,
                    backgroundColor: TodoConstants.primaryColor,
                  ),
                ),
                SizedBox(width: TodoConstants.paddingMedium),
                Expanded(
                  child: CustomButton(
                    label: TodoConstants.cancelButton,
                    onPressed: onCancel,
                    backgroundColor: Color(0xFFBDBDBD),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}