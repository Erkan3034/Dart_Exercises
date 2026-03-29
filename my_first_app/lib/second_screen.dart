import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> dartLetters = ['A', 'R', 'T'];
    final List<String> dersLetters = ['D', 'E', 'R', 'S', 'L', 'E', 'R', 'I'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dersleri'),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ÜSTE YAPIŞTIR
        children: [
          // SOL COLUMN (DERSLERI)
          Column(
            children: dersLetters.map((letter) {
              return Container(
                width: 95,
                height: 95,
                margin: const EdgeInsets.all(1), // 
                color: Colors.orange,
                child: Center(
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          // SAĞ TARAF
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // sola yasla
              children: [
                // ÜST ROW (DART)
                Row(
                  children: dartLetters.map((letter) {
                    return Container(
                      width: 90,
                      height: 95,
                      margin: const EdgeInsets.all(2),
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          letter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // BOŞ ALAN
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}