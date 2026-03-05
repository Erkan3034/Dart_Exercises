void main(List<String> args){
print("************Ogrenci Odaklanma Sistemi*************");
double sure = 0;
int gunSayisi = 5;

for (int i =1; i<=gunSayisi; i++){
  if (i==3){
    continue; 
  }
  double  toplamOdakSuresi = 10 + (i*2); 
  sure += toplamOdakSuresi; 
}

print("Toplam odaklanma süresi: $sure dakika");
}
