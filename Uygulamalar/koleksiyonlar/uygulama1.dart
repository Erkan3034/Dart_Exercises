void main(List<String> args) {
  veriGonder(["Telefon", "Tablet", "Laptop", "Masaüstü"]);
}

void veriGonder(List<String> sehirler) {
  for (int i = 1; i <5; i++) {
    if(i==3){
      print( "3. cihaza veri gönderilemedi");  
      continue; //3. cihazı atla
      
    }
    print("$i. cihaza veri gönderildi");
  }
}