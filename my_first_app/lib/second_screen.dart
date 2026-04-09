import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  Widget box(String harf) {
    return Container(
      width: 65, 
      height: 65,
      margin: const EdgeInsets.all(2),
      color: Colors.orange,
      child: Center(
        child: Text(
          harf,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


Widget kutu(String harff){
  return Container(
    width :150,
    height: 50,
    margin:EdgeInsets.all(2),
    color: Colors.amber,
    child:Center(
      child:Text(harff,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),)
    )
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Dersleri"),
        backgroundColor: Colors.cyan,
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              box("A"),
              box("R"),
              box("T"),
            ],
          ),

          
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              box("D"),
              box("E"),
              box("R"),
              box("S"),
              box("L"),
              box("E"),
              box("R"),
              box("İ"),
            ],
          ),
        ],
      ),
    );
  }
}