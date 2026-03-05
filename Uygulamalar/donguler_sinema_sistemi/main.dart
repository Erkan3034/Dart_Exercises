void main(List<String> args) {
  String sira = ""; // sira değişkeni, oturma planını tutmak için kullanılır
  for (int i = 1; i<=3; i++) { // 3 sıra dongusu
    sira += "$i. sıranın oturma planı: "; 
    for (int j = 1; j<=4; j++) { // 4 koltuk dongusu
      sira += "";
      if(i ==2 && j ==3 || i ==3 && j ==1){ // 2. sıranın 3. koltuğu ve 3. sıranın 1. koltuğu boş, diğerleri dolu
        sira += "[X]";
      }else{
        sira += "[O]";
      }
    }
    sira += "\n";
  }
  print(sira);
}

