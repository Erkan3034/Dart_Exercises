
void main(List<String> args) {
var saatlikUcret = 50;

var kaldigiSaat =4;

var toplamUcret = saatlikUcret * kaldigiSaat;

if (kaldigiSaat < 2) {
  print("Park bilgileri: \n Kaldığı Saat(ksıa): $kaldigiSaat, Toplam Ücret: $toplamUcret");
}else if (kaldigiSaat >= 2 && kaldigiSaat < 5) {
  print("Park bilgileri: \nKaldığı Saat(normal): $kaldigiSaat, Toplam Ücret: ${toplamUcret - 30}");
}else if (kaldigiSaat >= 5 && kaldigiSaat < 10) {
  print("Park bilgileri: Kaldığı Saat(uzun): $kaldigiSaat, Toplam Ücret: ${toplamUcret + 100}");
}

}