void main() {
  int sayi = 0;
  int toplam = 0;
  int sayac = 0;

  do {
    toplam += (sayi * 5); // Sayıyı 5 ile çarpıp toplama ekliyoruz
    sayac++;           // Sayacı 1 artırıyoruz
    sayi++;               // Döngü değişkenini 1 artırıyoruz
  } while (toplam <= 100);  // sayi, 100'e küçük veya eşit olduğu sürece dönmeye devam et

  print("İşlenen sayı adedi : $sayac");
  print("Toplam: $toplam");
}
