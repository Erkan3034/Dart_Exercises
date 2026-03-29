void main() {
  // LIST (Sıralı, indexli)

  List<String> isimler = ["Erkan", "Serkan", "Necip"];

  print(isimler[0]); // index ile erişim → Erkan

  isimler.add("Ayşe"); // sona ekler
  isimler.remove("Ahmet"); // değer siler

  print(isimler.length); // eleman sayısı
  print(isimler.contains("Erkan")); // var mı → true

  // SET (Tekrarsız veri)

  Set<int> sayilar = {1, 2, 3, 3, 3};

  print(sayilar); // {1,2,3} → tekrarları otomatik siler

  sayilar.add(4);
  sayilar.add(2); // zaten varsa eklenmez

  print(sayilar.contains(2)); // true

  // MAP (Key - Value)

  Map<String, int> yaslar = {
    "Erkan": 25,
    "Ahmet": 30,
  };

  print(yaslar["Erkan"]); // key ile erişim → 25

  yaslar["Mehmet"] = 28; // yeni ekleme
  yaslar["Erkan"] = 26; // güncelleme

  yaslar.remove("Ahmet"); // silme

  print(yaslar.keys); // tüm keyler
  print(yaslar.values); // tüm değerler


  // NULL SAFETY + COLLECTION

  List<String>? nullableListe; // null olabilir
  nullableListe = ["a", "b"];

  List<String> bosListe = []; // boş ama null değil

  // SPREAD OPERATOR (...)

  List<int> a = [1, 2];
  List<int> b = [3, 4];

  List<int> birlesmis = [...a, ...b]; // listeleri birleştirir

  print(birlesmis); // [1,2,3,4]

  // null-aware spread
  List<int>? c;
  List<int> sonuc = [...a, ...?c]; // c null ise hata vermez

 

  // COLLECTION IF / FOR

  bool aktif = true;

  List<String> menu = [
    "Ana Sayfa",
    if (aktif) "Profil", // şartlı ekleme
  ];

  List<int> sayilar2 = [1, 2, 3];

  List<int> ikiKat = [
    for (var s in sayilar2) s * 2 // loop içinde oluşturma
  ];

  print(menu);
  print(ikiKat);
}

/* 
List → API’den gelen veriler (ürün listesi vs.)
Set → benzersiz veri (ID’ler, tag’ler)
Map → JSON, config, user objeleri 
*/