
void main(List<String> args) {
  String ceza = "5.50";
  double cezaMiktari = double.parse(ceza);
  print("Ceza Miktarı: $cezaMiktari");

  int cezaGunSayisi = 4;

  double toplamCeza = cezaMiktari * cezaGunSayisi;
  print("Gecikilen Gün Sayısı: $cezaGunSayisi");
  print("Toplam Ceza: $toplamCeza");
}