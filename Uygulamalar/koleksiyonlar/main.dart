main(List<String> args) {
  // ======SAYILAR - Normal Liste======
  int sayi =4;
  List<int> sayilar = List.filled(5, 1, growable: false); //5 elemanlı bir liste oluşturur ve tüm elemanları 0 ile doldurur.
  sayilar[0] = 1;
  sayilar[1] = 2;
  sayilar[2] = 3;

  print(sayilar);
  print(sayilar.length);
  print(sayilar[3]);

  // ======KARISIK LISTE======
  List<dynamic> karisikListe = [1, "Merhaba", 3.14, true];
  print(karisikListe);

  for(var eleman in sayilar){
    print(eleman+10);
  }


  // ======SEHIRLER======
  List<String> sehirler = ["Ankara", "Istanbul", "Izmir", "Bursa"];
  for (String sehir in sehirler){
    print(sehir);
  }
}
