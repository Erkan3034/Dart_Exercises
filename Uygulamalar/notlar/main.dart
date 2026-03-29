void main() {
  selamVer("Erkan");
  selamVer();
}

void selamVer([String? isim]) {
  print("Merhaba ${isim ?? "misafir"}");
}

/* koseli parantezler ile tanimlanan parametreler opsiyoneldir. 
Yani fonksiyon cagrilirken bu parametreler verilmeyebilir. 
Bu durumda null degeri alirlar. Bu nedenle String? olarak tanimlanirlar. */
