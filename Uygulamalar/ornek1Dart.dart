void main(List<String> args) {
  String tshirtMtn = "250";
  String ayakkabiMtn = "1450.75";

  int tshirtFiyat = int.parse(tshirtMtn);
  double ayakkabiFiyat = double.parse(ayakkabiMtn);

  //print(tshirtFiyat);
  //print(ayakkabiFiyat);

  double toplam = tshirtFiyat + ayakkabiFiyat;

  bool isOver2000 = toplam > 2000 ? true : false;
  bool isOver1500andUnder200 = toplam > 1500 && toplam < 2000 ? true : false;
  if (isOver2000) {
    print("Süper İndirim ");
  } else if (isOver1500andUnder200) {
    print("Kargo Bedava");
  }else {
    toplam +=50;
    print("Kargo ücreti eklendi Toplam: $toplam");
  }
  print(toplam);
}