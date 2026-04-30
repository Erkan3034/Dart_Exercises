import 'package:flutter/material.dart';

class CardveListileKullanimi extends StatelessWidget {
  const CardveListileKullanimi({ Key?  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card ve List Kullanımı"),
        backgroundColor: Color.fromARGB(255, 3, 134, 182),
      ),
      body: Center(
        child:SingleChildScrollView( //ekran kaydırılabilir olsun diye
        child:Column(
          children: [
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani(),
            _tekListeElemani()
          ],
        ),
        ),
    ),
    );
  }




  Column _tekListeElemani() {
    return Column(
        children: [
          Card(
        color:Colors.blue.shade100,
        shadowColor:Color.fromARGB(255, 3, 134, 182),
        elevation: 10,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      child: ListTile(
        leading:CircleAvatar(
          child: Icon(Icons.add),
        ),
        title: Text("Flutter Dersleri"),
        subtitle: Text("Flutter ile uygulama geliştirme dersleri"),
        trailing: Icon(Icons.real_estate_agent),
      ),
    ),
    Divider(
      color: const Color.fromARGB(255, 10, 189, 183),
      thickness: 2,
      height: 10,
      indent: 80,
      endIndent: 80,
    ),
    ],
  );
  }
}