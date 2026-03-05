
void main(){
  int ? s1 = null;
  s1 = 9;
  print(s1 + 5);

  int hexaDecimalSayi = 0xAABBCC;
  print(hexaDecimalSayi);

  print("------------------------------");
  int age = 23;
  String name = "Erkan";
  String surname = "TURGUT";
  String message = "Merhaba ben  $name $surname  $age yaşındayım. İsmimdeki karakter sayısı: ${name.length}"; 
  print(message);
  print("------------------------------");

  int number1 = 10; 
  int number2 = 20;
  int number3 = 30;
  int sum = number1 + number2 + number3;
  print("Toplam Çevre: $sum");

  print("------------------------------");
  String? userName = "admin";
  String? password = "12345";

  bool isLoginSuccessful = userName == "admin" && password == "12345";

  if (isLoginSuccessful) {
    print("giriş başarılı");
  } else {
   print("giriş başarısız");
  }

print("------------------------------");
  int grade = 45;

  if (grade >= 90 && grade <= 100) { 
    print("AA");
  } else if (grade >= 80 && grade < 90) {
    print("BA");
  } else if (grade >= 70 && grade < 80) {
    print("BB");
  } else if (grade >= 60 && grade < 70) {
    print("CB");
  } else if (grade >= 50 && grade < 60) {
    print("DC");
  } else if ( grade < 50) {
    print("FF");
  }

print("------------------------------");
  
  double number4 = 55;
  double number5 = 60;
  double number6 = 75;
  double average = (number4 + number5 + number6) / 3;
  print("Ortalama: $average");

print("------------------------------");
  
 int kenar1 = 5;
 int kenar2 = 12;
 int kenar3 = 13;

 bool ucgenMi = (kenar1 + kenar2 > kenar3) && (kenar1 + kenar3 > kenar2) && (kenar2 + kenar3 > kenar1);
 bool eskenarMi = ucgenMi && (kenar1 == kenar2) && (kenar2 == kenar3);
 bool ikizkenarMi = ucgenMi && ((kenar1 == kenar2) || (kenar1 == kenar3) || (kenar2 == kenar3));

  if (eskenarMi) {
    print("eşkenar üçgendir");
  } else if (ikizkenarMi) {
    print("ikizkenar üçgendir");
  } else if (ucgenMi) {
    print("çeşitkenar üçgendir");
  } else {
    print("bir üçgen değildir");
  }

  print("------------------------------");
  int vizeNotu = 40;
  int finalNotu = 50;

  double ortalama = (vizeNotu * 0.4) + (finalNotu * 0.6);

  bool gectiMi = ortalama >= 50 ? true : false; 
  if (gectiMi) {
    print("Geçti");
  } else {
    print("Kaldı");
  }
}
