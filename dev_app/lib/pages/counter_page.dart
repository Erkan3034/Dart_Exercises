import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
 
 // variable

  int _counter = 0;
 //method

void _resetCounter(){
  setState(() {
    _counter = 0;
  });
}


void _incrementCounter(){
  // setState() metodu, Flutter'ın widget'ları yeniden çizmesini sağlar. Bu metodu çağırdığınızda, Flutter widget ağacını yeniden değerlendirir ve değişiklikleri ekrana yansıtır.
  setState(() {
    _counter++;
  });
}


 //UI
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 179, 201),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona $_counter kez tıklandı" , style:  TextStyle(fontSize: 24 , color: const Color.fromARGB(255, 72, 112, 27), fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Artır" , style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              onPressed: _resetCounter,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Sıfırla" , style: TextStyle(color: Colors.white),),
            )
          ]
        ),
      ),
    );
  }
}