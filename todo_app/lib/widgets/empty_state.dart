import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData icon;

  const EmptyState({
    super.key,
    required this.message,
    this.subtitle,
    this.icon = Icons.task_alt,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: TodoConstants.accentColor.withOpacity(0.6),
          ),
          SizedBox(height: TodoConstants.paddingLarge),
          Text(
            message,
            style: TextStyle(
              fontSize: TodoConstants.subtitleFontSize,
              fontWeight: FontWeight.w600,
              color: TodoConstants.darkGreen.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            SizedBox(height: TodoConstants.paddingSmall),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TodoConstants.paddingMedium,
              ),
              child: Text(
                subtitle!,
                style: TextStyle(
                  fontSize: TodoConstants.bodyFontSize,
                  color: TodoConstants.lightText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
