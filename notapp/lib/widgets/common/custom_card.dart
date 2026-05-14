import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color borderColor;

  const CustomCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.elevation,
    this.padding = const EdgeInsets.all(Sabitler.paddingMedium),
    this.margin,
    this.onTap,
    this.borderColor = Sabitler.gri,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: elevation ?? Sabitler.cardElevation,
        color: backgroundColor ?? Sabitler.beyaz,
        shape: RoundedRectangleBorder(
          borderRadius: Sabitler.borderRadius,
          side: BorderSide(color: borderColor, width: 0.5),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: Sabitler.borderRadius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
