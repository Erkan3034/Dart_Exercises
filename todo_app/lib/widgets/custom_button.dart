import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isSmall;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSmall) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: TodoConstants.paddingSmall,
            vertical: 6,
          ),
          backgroundColor: backgroundColor ?? TodoConstants.primaryColor,
          foregroundColor: foregroundColor ?? TodoConstants.white,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: TodoConstants.smallFontSize),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? TodoConstants.primaryColor,
        foregroundColor: foregroundColor ?? TodoConstants.white,
      ),
      child: Text(label),
    );
  }
}
