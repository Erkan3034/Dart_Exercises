void main (List<String> args) {
  double hiz = 0.0;

  while (hiz < 75.0) {
    hiz += 15.0;
    if (hiz < 75.0) {
      print("Hızınız:  $hiz km/h");
    } else if (hiz == 75.0) {
      print("Hızınız $hiz, hız sınırını aştınız.");
    }
  }
}
