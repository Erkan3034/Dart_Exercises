void main(List<String> args) {
  int otelKatSayisi = 3;
  int kattakiOdaSayisi = 2;

  for (int kat = 1; kat <= otelKatSayisi; kat++) {
    print("\nKAT $kat ->");
    print("=" * 20);
    
    for (int oda = 1; oda <= kattakiOdaSayisi; oda++) {
      print("  Oda No: $kat$oda");
    }
  }
}