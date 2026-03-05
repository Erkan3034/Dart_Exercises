import 'dart:io';
void main(List<String> args){
  print("Ürün Fiyatı : ");
  String? fiyatInput = stdin.readLineSync();
  if (fiyatInput != null){
    double fiyat = double.parse(fiyatInput);
    print("Fiyat: $fiyat");
    double kdvOrani = 0.18; 
    double kdvMiktari = fiyat * kdvOrani;
    double toplamFiyat = fiyat + kdvMiktari;
    print("KDV Miktarı: $kdvMiktari");
    print("Toplam Fiyat: $toplamFiyat");
  }
  else{
    print("fiyat girilmedi");
  }
}