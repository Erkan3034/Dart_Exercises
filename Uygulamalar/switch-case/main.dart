import 'dart:io';
void main(List<String> args){
  print("Departman numarasını giriniz:");
  var departmanNumarasi = int.parse(stdin.readLineSync()!);
  switch (departmanNumarasi) {
    case 1:
      print("Departman: Fatura İşlemleri");
      break;
    case 2:
      print("Departman: Teknik Destek");
      break;
    case 3:
      print("Departman: Müşteri Temsilcisi");
      break;
    default:
      print("Hatalı tuşlama yaptınız.");
  }
}