import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final bool isSmall;

  const CustomButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSmall) {
      return IconButton(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(icon ?? Icons.check),
        color: foregroundColor ?? Sabitler.anaRenk,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Sabitler.anaRenk,
        foregroundColor: foregroundColor ?? Sabitler.beyaz,
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  foregroundColor ?? Sabitler.beyaz,
                ),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon),
                if (icon != null && label != null) SizedBox(width: 8),
                if (label != null) Text(label!),
              ],
            ),
    );
  }
}
