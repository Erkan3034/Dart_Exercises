void main(List<String> args) {
  int xp = 150;

  double? bonusMultiplyer = 1.5;

  double totalXp = xp * bonusMultiplyer;
  print("Toplam XP: $totalXp");
  
  bool isLevelUp = totalXp > 200 ? true : false;
  if (isLevelUp) {
    print("Seviye atladınız. Kazanılan Toplam XP: $totalXp");
  } else {
    print("Daha fazla XP kazanmalısınız.");
  }
}