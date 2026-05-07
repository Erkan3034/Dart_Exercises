import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ders sayısı : $dersSayisi"),
        Text("Ortalama : ${ortalama.toStringAsFixed(2)}"), // toStringAsFixed(2) -> ortalamayi 2 ondalik basamakla gosterir
      ],
    );
  }
}