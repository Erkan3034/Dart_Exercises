import 'package:burc_uygulamasi/data/strings.dart';
import 'package:burc_uygulamasi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:burc_uygulamasi/burc_item.dart';

class BurcListesi extends StatelessWidget {

  late List<Burc> tumBurclar ; //late : sonradan deger atanacak demek

  BurcListesi({super.key}) {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Burç Listesi", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: ListView.separated(
          
          itemCount: tumBurclar.length,
          itemBuilder: (context, index) { //index : o anki elemanin indexi , ccontext : o anki yapinin contexti
            return BurcItem(listelenenBurc: tumBurclar[index]);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          scrollDirection: Axis.vertical,
          
        ),
      ),
    );
  }
      
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici  =[]; 
    for(int i = 0; i<12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];

      var burcKucukResim=(
        "${Strings.BURC_ADLARI[i].toLowerCase()}${i+1}.png"
      );
      var burcBuyukResim=(
        "${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i+1}.png"
      );


      Burc eklenecekBurc = Burc(
        burcAdi,
        burcTarihi,
        burcDetayi,
        burcKucukResim,
        burcBuyukResim
      );
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}