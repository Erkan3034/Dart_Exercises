import 'dart:io';

void main(){
  sayiAlveYazdir();
}

// kullanıcıdan alınan pozitif int değerleri bir listede tutulur, kullanıcı -1 girdiğinde program sonlanır ve girilen sayıların ortalaması ekrana yazdırılır


sayiAlveYazdir(){
  List<int> sayilar =[];
  double toplam = 0;

  while(true){
    print("Poziti bir sayı giriniz(Çıkmak için -1): ");
    int sayi = int.parse(stdin.readLineSync()!);

    if(sayi== -1){
      print("Girilen sayıların ortalaması : ${(toplam/sayilar.length)}"); // ortalama hesapla ve yazdır
      break; // döngüyü sonlandır
    }
    else if(sayi < -1){
      print("Lütfen pozitif bir sayı giriniz.");
      continue; // geçerli olmayan girişi atla
    }
    else{
      sayilar.add(sayi); // sayıyı listeye ekle
      toplam += sayi; // toplamı güncelle
    }
  }

 }