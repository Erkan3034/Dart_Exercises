import 'package:flutter/material.dart';
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
 
 // text editing controller, textfield'daki veriyi tutacak
  TextEditingController myController = TextEditingController();
 
 
 // greet user metodu, textfield'daki veriyi alıp ekrana yazdıracak

 void greetUser(){
  String name = myController.text;

  showDialog(
    context: context, 
    builder: (context) => AlertDialog (
      shadowColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: Text('Hello, $name!'),
    )
  );
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Padding(
          padding:  EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                  labelText: 'Enter your name',

                ),
              ),
          
              ElevatedButton(
                onPressed: greetUser,
                child: Text('Tap me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}