import 'dart:io';
int hacmiHesapla(){
  print ("Küpün kenar uzunluğunu giriniz: ");
  String? kenarInput = stdin.readLineSync();
  if (kenarInput != null){
    double kenar = double.parse(kenarInput);
    return (kenar*kenar * kenar).toInt();
  }
  else{
    print("Kenar uzunluğu girilmedi.");
    return 0;
  }
}
void main(List<String> args){
  int hacim = hacmiHesapla();
  print("Küpün hacmi: $hacim");

}