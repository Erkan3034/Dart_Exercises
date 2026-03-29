import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "Erkan";
    String img_url= "https://codenthia-com.onrender.com/static/codenthiaRevize.png";
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 36, 83),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'My First App',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 3),
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
            gradient: const LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 146, 178, 193)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
            ), 
          ),
          alignment: Alignment.center,
          width: 200,
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: icIceKutulariGoster(title),
        )
      ),

      floatingActionButton: FloatingActionButton(
        splashColor: Colors.green,
        onPressed: () {
          debugPrint("Floating Action Button Pressed");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        child: const Icon(Icons.ads_click, color: Color.fromARGB(255, 197, 72, 72), fontWeight: FontWeight.bold,),
      ),
    );
  }
}

Container icIceKutulariGoster(String title) {
  return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(132, 61, 91, 112),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 150,
          height: 50,
          alignment: Alignment.topCenter,
          child: Center(
            child: Text("Merhaba, $title!" ,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}