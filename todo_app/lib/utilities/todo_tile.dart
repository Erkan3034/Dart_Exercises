import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


   ToDoTile({
    super.key , 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.only(top:15.0, left: 15, right: 15),
        child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: widget.deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                )
              ],
            ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: sort_child_properties_last
          
            child: Row(
              children: [
                //checkbox 
                Checkbox(
                  value: widget.taskCompleted, 
                  onChanged: widget.onChanged,
                  activeColor: const Color.fromARGB(255, 40, 48, 9),
                  ),
                //task name
                Text(
                  widget.taskName, 
                  style: TextStyle(decoration: widget.taskCompleted? TextDecoration.lineThrough : TextDecoration.none),
                  )
              ],
            ),
          ),
        ),
      );
   
  }
}