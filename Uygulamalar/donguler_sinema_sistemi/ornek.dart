import 'dart:io';

void main(List<String> args){
  double toplamYol = 0.0;
  for (int i=1; i<=4; i++){
    if (i == 2){
      stdout.write("Mahalle 2'den çıkış yapıldı. Bu mahallede yol çalışması var, diğer mahalleye geçiliyor.");
      continue;
    }
    toplamYol += 5.5;
      switch (i) {
    case 1:
      print("Mahalle 1'den çıkış yapıldı.");
      break;
    case 2:
      print("Mahalle 2'den çıkış yapıldı.");
      break;
    case 3:
      print("Mahalle 3'den çıkış yapıldı");
      break;
    case 4:
      print("Mahalle 4'den çıkış yapıldı.");
      break;
    case 5:
      print("Toplam yol 22 km'dir. SOn mahallenin çıkışına ulaşıldı.");
      break;
    default:
      print("Toplam yol 22 km değildir.");
  }
  }
  print("Toplam yol: $toplamYol");



}