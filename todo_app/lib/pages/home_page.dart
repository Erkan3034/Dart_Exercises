import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // if this is the 1st time ever opening this app, then create default data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  

    void checkBoxChanged(bool? value, int index) {
      setState(() {
        db.toDoList[index][1] = value;
      });
      db.updateDataBase();
    }
     void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear(); //clear text field after adding task
    });
    db.updateDataBase();
    Navigator.of(context).pop(); //close dialog
  }
    void _createNewTask() {
      showDialog(
        context: context, 
        builder: (context) {
          return DialogBox(
            my_controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop(); //close dialog
            },
          );
        }
        );
    } 

//delete task
    void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],

            onChanged: (valueOfCheckbox) { //checkboxa tıklandığında ne olacak
              checkBoxChanged(valueOfCheckbox, index);
            },
            deleteFunction: (context) =>deleteTask(index),
          );
        },
      ),
    );
  }


}