import 'dart:io';
void main(List<String> args){
  print("Ürün Fiyatı : ");
  double fiyat = double.parse(stdin.readLineSync()!);
  print("Fiyat: $fiyat");
  double kdvOrani = 0.18; 
  double kdvMiktari = fiyat * kdvOrani;
    double toplamFiyat = fiyat + kdvMiktari;
    print("KDV Miktarı: $kdvMiktari");
    print("Toplam Fiyat: $toplamFiyat");
}