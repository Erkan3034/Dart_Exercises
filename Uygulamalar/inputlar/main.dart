import 'dart:io';

void main(List<String> args) {
  print("Lütfen isminizi giriniz:");
  String? input = stdin.readLineSync();

  if (input != null) {
    print("Girdiğiniz isim: $input");
  } else {
    print("Geçerli bir isim girmediniz.");
  }
}