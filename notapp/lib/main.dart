import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';
import 'package:notapp/widgets/ortalama_hesaplama_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Not Uygulaması',
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity, // her platforma uygun sekilde uygun renk yogunlugu olusturur
      ),
      home :  OrtalamaHesaplamaPage(),
    );
  }
}
  
