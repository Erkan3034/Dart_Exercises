import 'dart:io';
void main(){
  print("Yakmak İstediğiniz Kalori Miktarını Giriniz:");
  String yakilacakKalori = stdin.readLineSync()!;
  double toplamKalori = adimMiktari(kalori: double.parse(yakilacakKalori));
  print("Atmanız Gereken Adım Sayısı: $toplamKalori");
}

double adimMiktari({required double kalori}) => kalori * 20;