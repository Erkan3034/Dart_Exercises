import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müzik Çalar Kontrolü"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

    

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Şarkı çalma listesine eklendi!");
        },

        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              
              Container(
                width: 150, 
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage("https://i.pinimg.com/236x/9b/61/af/9b61afe7cf09e88325f6d356758b1e88.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.4, 
                  ),
                  color: Colors.grey.shade800, 
                  borderRadius: BorderRadius.circular(15), 
                ),
                child: const Center(
                  
                  child: Icon(
                    Icons.music_note,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Sezen Aksu", 
                style: TextStyle(
                  fontSize: 36, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 2, 
                ),
              ),
              const SizedBox(height: 10), 
              Text(
                "Gülümse",
                style: TextStyle(
                  fontSize: 24, 
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 40), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 40, 
                    color: Colors.black87,
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.pause_circle_filled),
                    iconSize: 70, 
                    color: Colors.black,
                  ),
               
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next),
                    iconSize: 40,
                    color: Colors.black87,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}