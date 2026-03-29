// main.dart

void main() {
  selamVer("Erkan"); // zorunlu parametre → vermek zorundasın

  selamVerOptional(); // verilmez → null olur
  selamVerOptional("Ahmet");

  selamVerNamed(); // isim verilmez → null
  selamVerNamed(isim: "Mehmet"); // isimle çağrılır

  selamVerRequired(isim: "Ayşe"); // required → vermek zorunlu

  selamVerDefault(); // verilmez → default kullanılır
  selamVerDefault(isim: "Zeynep");

  var k = Kullanici(isim: "Erkan", yas: 25); // constructor
}

// NORMAL → zorunlu parametre
void selamVer(String isim) {
  print("Merhaba $isim");
}

// [] → optional positional (sıralı ama opsiyonel)
void selamVerOptional([String? isim]) {
  print("Merhaba ${isim ?? "misafir"}"); // null ise misafir
}

// {} → named parametre (isimle gönderilir)
void selamVerNamed({String? isim}) {
  print("Merhaba ${isim ?? "misafir"}");
}

// required → named parametreyi zorunlu yapar
void selamVerRequired({required String isim}) {
  print("Merhaba $isim");
}

// default değer → parametre verilmezse bunu kullanır
void selamVerDefault({String isim = "misafir"}) {
  print("Merhaba $isim");
}

// Flutter'da çok kullanılan yapı
class Kullanici {
  final String isim;
  final int yas;

  // required this.xxx → zorunlu alan
  Kullanici({required this.isim, required this.yas});
}
