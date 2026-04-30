import 'dart:math';

void main() {
  Random rnd = Random();
  // 1. Liste oluştur
  List<int> sayilar = [];

  for (int i = 0; i < 1000; i++) {
    sayilar.add(rnd.nextInt(101));
  }
  // 2. Map ile say
  Map<int, int> tekrarSayilari = {};
  for (var sayi in sayilar) {
    if (tekrarSayilari.containsKey(sayi)) {
      tekrarSayilari[sayi] = tekrarSayilari[sayi]! + 1;
    } else {
      tekrarSayilari[sayi] = 1;
    }
  }
  // 3. Tekrar edenleri yazdır
  for (var entry in tekrarSayilari.entries) {
    if (entry.value > 1) {
      print("${entry.key} sayısı ${entry.value} kere üretilmiştir.");
    }
  }

  print(sayilar);
}