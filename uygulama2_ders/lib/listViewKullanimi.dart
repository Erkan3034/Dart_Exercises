import 'package:flutter/material.dart';

class Listviewkullanimi extends StatelessWidget {
   Listviewkullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(index + 1, "Ogrenci Adı : ${index + 1}", "Ogrenci Soyadı : ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ogrenci Listesi"),
        backgroundColor: Color.fromARGB(255, 3, 134, 182),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oAnkiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0 ? Colors.blue.shade100 : Colors.green.shade100,
            shadowColor: Color.fromARGB(255, 3, 134, 182),
            child: ListTile(
              onTap: () => print("Seçilen Öğrenci : ${oAnkiOgrenci.ogrenciAd} ${oAnkiOgrenci.ogrenciSoyad}"),
              leading: CircleAvatar(
                child: Text(oAnkiOgrenci.ogrenciNo.toString()),
              ),
              title: Text(oAnkiOgrenci.ogrenciAd),
              subtitle: Text(oAnkiOgrenci.ogrenciSoyad),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          if ((index + 1) % 4 == 0) {
            return Divider(
              color: Colors.green[400],
              thickness: 2,
              indent: 20,
              endIndent: 20,
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  ListView _klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogrenci) => ListTile( //her bir ogrenci için ListTile oluşturduk
                leading: CircleAvatar(
                  child: Text(ogrenci.ogrenciNo.toString()), //ogrenci numarasını avatar içine yazdık
                ),
                title: Text(ogrenci.ogrenciAd), //ogrenci adını başlık olarak yazdık
                subtitle: Text(ogrenci.ogrenciSoyad), //ogrenci soyadını alt başlık olarak yazdık
              ))
          .toList(), //map ile her bir ogrenci için ListTile oluşturduk ve toList ile map sonucunu listeye çevirdik
    );
  }
}



class Ogrenci {
  int ogrenciNo;
  String ogrenciAd;
  String ogrenciSoyad;

  Ogrenci(this.ogrenciNo, this.ogrenciAd, this.ogrenciSoyad);
}