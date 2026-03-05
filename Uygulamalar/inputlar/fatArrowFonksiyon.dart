int minOlaniBul(int a, int b) => a < b ? a : b; //fat arrow fonksiyon, tek satırda yazılabilir ve return ifadesi otomatik olarak eklenir

void main(List<String> args) {
  int minSayi = minOlaniBul(15, 25);
  print("Minimum sayı: $minSayi");
}