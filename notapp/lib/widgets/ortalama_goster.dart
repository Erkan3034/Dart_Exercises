import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi,
  });

  Color _getProgressColor() {
    if (ortalama >= 3.5) return Sabitler.notAABB;
    if (ortalama >= 2.5) return Sabitler.notCB;
    if (ortalama >= 2.0) return Sabitler.notCC;
    return Sabitler.notFF;
  }

  @override
  Widget build(BuildContext context) {
    final progressValue = ortalama / 4.0;
    final color = _getProgressColor();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Sabitler.anaRenk.shade50,
            Sabitler.anaRenk.shade100,
          ],
        ),
        borderRadius: Sabitler.borderRadius,
        border: Border.all(color: Sabitler.gri, width: 1),
      ),
      padding: EdgeInsets.all(Sabitler.paddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Başlık
          Text(
            "GNO",
            style: TextStyle(
              fontSize: Sabitler.smallFontSize,
              color: Sabitler.koyu.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: Sabitler.paddingSmall),

          // Dairesel ilerleme göstergesi
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progressValue.clamp(0.0, 1.0),
                  strokeWidth: 8,
                  backgroundColor: Sabitler.gri,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Column(
                children: [
                  Text(
                    ortalama.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    "/4.0",
                    style: TextStyle(
                      fontSize: Sabitler.smallFontSize,
                      color: Sabitler.koyu.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: Sabitler.paddingMedium),

          // Ders sayısı
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sabitler.paddingSmall,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Sabitler.beyaz.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Ders: $dersSayisi",
              style: TextStyle(
                fontSize: Sabitler.smallFontSize,
                fontWeight: FontWeight.w500,
                color: Sabitler.koyu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}