import 'package:notapp/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];


  static dersEkle(Ders ders){
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla(){
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((ders) {
      toplamNot += (ders.harfDegeri * ders.krediDegeri);
      toplamKredi += ders.krediDegeri;
    });
    if(toplamKredi == 0){
      return 0;
    }
    return toplamNot / toplamKredi;
  }

}