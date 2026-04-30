void main(){
  int toplamAltin = 0;
  for(int i=1; i<=5; i++){
    if(i==3){
      print("3. katın altın miktarı hesaplanmadı.");
      continue;
    }
    print("$i. katın altın miktarı: ${kacAltinAlindi(katNumarasi: i)}");
    toplamAltin += kacAltinAlindi(katNumarasi: i);
  }
  print("Toplam altın miktarı: $toplamAltin");
}

int kacAltinAlindi({int katNumarasi = 0}) => katNumarasi * 50;