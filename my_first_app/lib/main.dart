import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //stateles widget her zaman build fonksiyonu ile çalışır.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İlk Sayaç Uygulamam.',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 84, 9, 215)),
      ),
      home:  MyHomePage(title: 'Flutter Sayaç Uygulaması'),
    );
  }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sayac = 0;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Butona basılma sayısı: ',
            ),
            Text(
              
              sayac.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Butona basıldı.");
          sayaciArttir();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  void sayaciArttir() {
    setState(() {
      
    });
  sayac++;
}
}

  
