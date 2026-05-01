import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];

  // reference the hive box
  final _myBox = Hive.box('mybox');

  // run this methos if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }


  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }


  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}