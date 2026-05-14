import 'package:dev_app/pages/first_page.dart';
import 'package:dev_app/pages/home_page.dart';
import 'package:dev_app/pages/settings_page.dart';
import 'package:dev_app/pages/contact_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),


      routes : {
        '/firstpage' : (context) => FirstPage(),
        '/homepage' : (context) => HomePage(),
        '/settingspage' : (context) =>SettingsPage(),
        '/contactpage' : (context) => ContactPage(),
      }
    );
  }
}


/*
  body: Column( // column ile dikeyde sıralama yaparız(ama sığmazsa taşma yapar, taşmayı çözmek için ise body: ListView() yapabiliriz)
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ContainerWidget(),
            _ContainerWidget(),
            _ContainerWidget(),
          ],
        ),
 */

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

   List<String> names = [
    'Ahmet',
    'Mehmet',
    'Ayşe',
    'Fatma',
    'Ali',
    'Veli',
    'Zeynep',
    'Emre',
    'Deniz',
    'Seda',
    'Can',
    'Ece',
    'Murat',
    'Gül',
    'Serkan',
    'Derya',
    'Hakan',
    'Selin',
    'Onur',
    'Bahar',
    'Erkan',
    'Sibel',
    'Tugay',
    'Yasemin',
    'Kadir',
    'Ebru',
    'Cem',
      'Nazan',
      'Okan',
      'Pelin',
      'Rıza',
      'Seda',
      'Tugay'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Flutter Container Widget' , style: TextStyle(color: Colors.white,  fontSize: 18, fontWeight: FontWeight.bold),),
          backgroundColor: const Color.fromARGB(255, 0, 63, 115),
          leading: Icon(Icons.menu, color: Colors.white, size: 30, ),
          actions: [
            Icon(Icons.search, color: Colors.white, size: 30, ),
            SizedBox(width: 10,),
            Icon(Icons.account_circle, color: Colors.white, size: 30, ),
            SizedBox(width: 10,),],
        ),
        body: ListView.separated(
          itemCount: names.length,
          itemBuilder: (context, index) =>ListTile(
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Seçilen isim:  ${names[index]}', style: TextStyle(fontWeight: FontWeight(800), color: const Color.fromARGB(255, 15, 12, 12)),) , backgroundColor: const Color.fromARGB(255, 119, 228, 117),)
              )
            },
            tileColor: index % 2 == 0
                ? Colors.indigo
                : Colors.indigo.shade800,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(names[index][0], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            title: Text(names[index], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle: Text('Flutter Developer', style: TextStyle(color: Colors.white70, fontSize: 14),),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
          ),
          separatorBuilder: (context, index) => 
           Divider(color: const Color.fromARGB(255, 194, 6, 6), thickness: 2, indent: 20, endIndent: 20,),
        ),
      ),
    );
  }
}


/*
  body: Column( // column ile dikeyde sıralama yaparız(ama sığmazsa taşma yapar, taşmayı çözmek için ise body: ListView() yapabiliriz)
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ContainerWidget(),
            _ContainerWidget(),
            _ContainerWidget(),
          ],
        ),
 */


class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 147, 38, 190),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          size: 100,
          color: Colors.white,
        )
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Flutter Container Widget' , style: TextStyle(color: Colors.white,  fontSize: 18, fontWeight: FontWeight.bold),),
          backgroundColor: const Color.fromARGB(255, 0, 63, 115),
          leading: Icon(Icons.menu, color: Colors.white, size: 30, ),
          actions: [
            Icon(Icons.search, color: Colors.white, size: 30, ),
            SizedBox(width: 10,),
            Icon(Icons.account_circle, color: Colors.white, size: 30, ),
            SizedBox(width: 10,),],
        ),
        body: GridView.builder(
          gridDelegate: 
              SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // her satırda kaç eleman olacağını belirler
          ),
          padding: EdgeInsets.all(10),
          itemCount: 64, // GridView'de gösterilecek öğe sayısı
          itemBuilder: (context, index) => _ContainerWidget(),
        ),
      ),
    );
  }
}

 */

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 147, 38, 190),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          size: 20,
          color: Colors.white,
        )
      ),
    );
  }
}