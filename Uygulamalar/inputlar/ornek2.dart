import 'dart:io';
void main(List<String> args) {
  print("Lütfen doğum yılınızı giriniz:");
  String? input = stdin.readLineSync();

  if (input != null) {
    int birthYear = int.parse(input);
    int age = DateTime.now().year - birthYear;
    print("Girdiğiniz yaş: $age");
  } else {
    print("Geçerli bir doğum yılı girmediniz.");
  }

  print("-----yas alma-------");

  print("Lütfen yaşınızı giriniz:");
  String? ageInput = stdin.readLineSync();
  if (ageInput != null) {
    int age = int.parse(ageInput);
    int birthYear = DateTime.now().year - age;
    print("Doğum yılınız: $birthYear");
  } else {
    print("gecerli  bir yaş girmediniz.");
  }
}