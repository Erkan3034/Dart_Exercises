import 'package:dev_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: const Color.fromARGB(255, 129, 163, 191),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 129, 163, 191) ,
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white,),
              title: Text('H O M E', style: TextStyle(color: Colors.white),),
              onTap: (){

                Navigator.pop(context); // Drawer'ı kapatır once.
                // ana sayfaya git.
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white,),
              title: Text('Settings', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.pop(context); // Drawer'ı kapatır once.
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.white,),
              title: Text('Contact', style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.pop(context); // Drawer'ı kapatır once.
                Navigator.pushNamed(context, '/contactpage');
              },
              ),
          ],
        ),
      ),

      body: Center(
        child: Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 147, 38, 190),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'First Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ),
        ),
      ),
      
    );
  }
}


/*

import 'package:dev_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: const Color.fromARGB(255, 129, 163, 191),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 147, 38, 190),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            
          child: ElevatedButton(            
            child: const Text(
              'Go to Second Page',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/secondpage');
            },

          ),
        
        )
        ),
      ),
    );
  }
} */