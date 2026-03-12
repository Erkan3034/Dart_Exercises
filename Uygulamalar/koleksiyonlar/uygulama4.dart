import 'dart:io';
void main(){
  print("Ürün Fiyatını Giriniz:");
  double fiyat = double.parse(stdin.readLineSync()!);
  double kdvMiktari = kdvHesapla(fiyat: fiyat);
  print("KDV Miktarı: $kdvMiktari");
  print("KDV dahil Toplam Fiyat: ${fiyat + kdvMiktari}");

}

double kdvHesapla({double fiyat =0.0, double kdvOrani = 0.20}) {
  return fiyat * (kdvOrani);
}