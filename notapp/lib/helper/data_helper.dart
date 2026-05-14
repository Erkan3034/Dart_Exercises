import 'package:notapp/model/ders.dart';

/*
 Ders listesini tutan ve yeni dersleri ekleyen, ortalama hesaplayan sınıfimiz
 */
class DataHelper {
  static List<Ders> tumEklenenDersler = [];


  static void dersEkle(Ders ders){
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla(){
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var ders in tumEklenenDersler) {
      toplamNot += (ders.harfDegeri * ders.krediDegeri);
      toplamKredi += ders.krediDegeri;
    }
    if(toplamKredi == 0){
      return 0;
    }
    return toplamNot / toplamKredi;
  }

}