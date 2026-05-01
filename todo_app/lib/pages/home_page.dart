import 'package:flutter/material.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final _controller = TextEditingController();

  //list of to do tasks
    List toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];


    void checkBoxChanged(bool? value, int index) {
      setState(() {
        toDoList[index][1] = value;
      });
    }

    void _createNewTask() {
      showDialog(
        context: context, 
        builder: (context) {
          return DialogBox(
            my_controller: TextEditingController(),
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop(); //close dialog
            },
          );
        }
        );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 91, 118, 65),
      appBar: AppBar(
        title: const Text('My Todo App'),

      ),

      //floating action button for creating new tasks
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],

            onChanged: (valueOfCheckbox) { //checkboxa tıklandığında ne olacak
              checkBoxChanged(valueOfCheckbox, index);
            },
          );
        },
      ),
    );
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop(); //close dialog
  }
}