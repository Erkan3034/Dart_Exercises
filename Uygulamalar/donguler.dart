void main(List<String> args){
  print("--------------FOR DONGÜSÜ-------------");
  for(int i=1 ; i<=100 ; i++){
    if (i % 15 ==0){
      print(i*i);
    }
  }

  print("-------------------WHİLE-------------------");
  int j =100;
  while(j>0){
    if (j % 15 ==0){
      print(j*j);
    }
    j--;
  }


  print("-------------------DO WHİLE-------------------");
  int k =100;
  do{
    if (k % 15 ==0){
      print(k*k);
    }
    k--;
  }
  while(k>0);
}