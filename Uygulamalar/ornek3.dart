
void main(List<String> args) {
  String sadakatPuanMtn = "135";
  int sadakatPuani = int.parse(sadakatPuanMtn);

  bool hediyeKazandimi = sadakatPuani > 100;

  if (hediyeKazandimi) {
  print("Hediye Kazanıldı.");
  sadakatPuani -= 100;
  print("Kalan Sadakat Puanı: $sadakatPuani");
  } else {
    print("Hediye Kazanılamadı. Daha fazla puan kazanmalısınız.");
    print("Mevcut Sadakat Puanı: $sadakatPuani");
  }
  
}