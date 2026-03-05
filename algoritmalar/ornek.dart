
void main(List<String> args) {
String mesafe = "450.5";
double mesafeDouble = double.parse(mesafe);
int harcananYakit = 30;

double tuketilenYakit = (harcananYakit / mesafeDouble )*100;
print("Tüketilen Yakıt Miktarı: $tuketilenYakit litre");

if(tuketilenYakit <5){
  print("Yakıt tüketimi çok düşük, aracınız çok ekonomik.");
}else if(tuketilenYakit >=5 && tuketilenYakit <=8){
  print("Yakıt tüketimi normal, aracınız Normal yakıyor.");
}else{
  print("Yakıt tüketimi yüksek, aracınız çok fazla yakıyor.");
}
}