import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class GradeChip extends StatelessWidget {
  final double notDegeri;
  final String notAdi;

  const GradeChip({
    super.key,
    required this.notDegeri,
    required this.notAdi,
  });

  Color _getColor() {
    return Sabitler.getNotRengi(notDegeri);
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sabitler.paddingSmall,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6),
          Text(
            "$notAdi ($notDegeri)",
            style: TextStyle(
              fontSize: Sabitler.smallFontSize,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
