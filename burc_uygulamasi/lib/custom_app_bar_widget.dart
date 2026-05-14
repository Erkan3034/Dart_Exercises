// widgets/custom_app_bar.dart - This file is part of the widgets module
import 'package:flutter/material.dart';
import 'package:burc_uygulamasi/zodiac_colors_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String colorKey;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    required this.title,
    required this.colorKey,
    this.actions,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = ZodiacColors.getGradient(colorKey);

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: ZodiacColors.getPrimaryColor(colorKey).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: onBackPressed ?? () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (actions != null)
                Row(children: actions!)
              else
                SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
