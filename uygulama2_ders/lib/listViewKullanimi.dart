import 'package:flutter/material.dart';

class Listviewkullanimi extends StatelessWidget {
   Listviewkullanimi({super.key});

  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
    BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
    BottomNavigationBarItem(icon: Icon(Icons.countertops), label: "Counter"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Do"),
  ];
  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(index + 1, "Öğrenci Adı : ${index + 1}", "Öğrenci Soyadı : ${index + 1}"),
  );

  final _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
        backgroundColor: Color.fromARGB(255, 3, 134, 182),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items, 
        backgroundColor: Color.fromARGB(255, 3, 134, 182), 
        selectedItemColor: const Color.fromARGB(255, 137, 93, 93),
         unselectedItemColor: const Color.fromARGB(135, 50, 57, 35) 
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
        separatorBuilder: (context, index) { // her 4 elemandan sonra bir divider ekler
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