import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/models/task.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final Task? fullTask;

  const TaskCard({
    Key? key,
    required this.taskName,
    required this.isCompleted,
    this.onChanged,
    this.onDelete,
    this.onEdit,
    this.fullTask,
  }) : super(key: key);

  Color _getPriorityColor() {
    if (fullTask == null) return TodoConstants.accentColor;
    
    switch (fullTask!.priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.urgent:
        return Color(0xFFB71C1C);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: TodoConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: TodoConstants.borderRadius,
        side: BorderSide(
          color: isCompleted ? TodoConstants.completedColor : TodoConstants.accentColor,
          width: 1.5,
        ),
      ),
      color: isCompleted 
          ? TodoConstants.completedColor.withOpacity(0.3)
          : TodoConstants.white,
      child: Padding(
        padding: EdgeInsets.all(TodoConstants.paddingMedium),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: TodoConstants.darkGreen,
              checkColor: TodoConstants.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: TodoConstants.paddingSmall),

            // Öncelik göstergesi
            if (fullTask != null)
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: _getPriorityColor(),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            SizedBox(width: TodoConstants.paddingMedium),

            // Görev adı ve kategori
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                      fontSize: TodoConstants.bodyFontSize,
                      fontWeight: FontWeight.w500,
                      color: isCompleted 
                          ? TodoConstants.lightText 
                          : TodoConstants.darkText,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: TodoConstants.lightText,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (fullTask?.category != null) ...[
                    SizedBox(height: 4),
                    Text(
                      '${fullTask!.category.emoji} ${fullTask!.category.label}',
                      style: TextStyle(
                        fontSize: TodoConstants.smallFontSize,
                        color: TodoConstants.lightText,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            SizedBox(width: TodoConstants.paddingSmall),

            // Delete Button
            IconButton(
              icon: Icon(Icons.delete_outline, color: TodoConstants.deleteColor),
              onPressed: onDelete,
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
