import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    Key? key,
    required this.message,
    this.icon = Icons.inbox,
    this.actionLabel,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Sabitler.gri,
          ),
          SizedBox(height: Sabitler.paddingLarge),
          Text(
            message,
            style: TextStyle(
              fontSize: Sabitler.bodyFontSize,
              color: Color(0xFF999999),
            ),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...[
            SizedBox(height: Sabitler.paddingMedium),
            ElevatedButton(
              onPressed: onAction,
              child: Text(actionLabel!),
            ),
          ]
        ],
      ),
    );
  }
}
