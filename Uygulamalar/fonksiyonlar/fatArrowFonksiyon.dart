int minOlaniBul(int a, int b) => a < b ? a : b; //fat arrow fonksiyon, tek satırda yazılabilir ve return ifadesi otomatik olarak eklenir

int ciftToplam(int a){ 
  int toplam = 0;
  for (int i = 0; i <= a; i++) {
    if (i % 2 == 0) { 
      toplam += i; 
    }
  }
  return toplam;
}

double daireAlani(double yaricap, [double pi = 3.14]) => pi * yaricap * yaricap; //daire alanı


String ucgenTuruBelirler({int? kenarA, int? kenarB, int? kenarC}) => kenarA == kenarB && kenarB == kenarC ? "Eşkenar" : kenarA == kenarB || kenarB == kenarC || kenarA == kenarC ? "İkizkenar" : "Çeşitkenar";

void main(List<String> args) {
  int minSayi = minOlaniBul(15, 25);
  print("Minimum sayı: $minSayi");


  print("--------- Çift Toplama----------");
  int ciftSayi = ciftToplam(5);
  print("Çift sayıların toplamı: $ciftSayi");

  print("--------- Daire Alanı----------"); 
  double alan = daireAlani(5);
  print("Daire Alanı: $alan");

  print("--------- Üçgen Türü Belirleme----------");
  String ucgenTuru = ucgenTuruBelirler(kenarA: 3, kenarB: 4, kenarC: 5);
  print("Üçgen Türü: $ucgenTuru");
}


