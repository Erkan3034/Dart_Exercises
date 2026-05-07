import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({ //constructor
    super.key, 
    required this.ortalama, 
    required this.dersSayisi}
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ders sayısı : $dersSayisi"),
        Text("Ortalama : $ortalama"),
        Text("Ders sayısı : $dersSayisi"),
      ],
    );
  }
}