bool depoDoluMu({int anlik = 0, int max = 100}) => anlik >= max;

void main() {
  int su = 0;
  while (!depoDoluMu(anlik: su, max: 100)) {
    su += 25;
    print("Mevcut Su: $su Litre");
  }
  print("Depo Doldu!");
}