import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/task.dart';

class TaskDetailPage extends StatefulWidget {
  final Task? task;
  final ToDoDatabase db;

  const TaskDetailPage({
    Key? key,
    this.task,
    required this.db,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TaskPriority _selectedPriority;
  late TaskCategory _selectedCategory;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(text: widget.task?.description ?? '');
    _selectedPriority = widget.task?.priority ?? TaskPriority.medium;
    _selectedCategory = widget.task?.category ?? TaskCategory.other;
    _selectedDueDate = widget.task?.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen görev başlığı yazınız')),
      );
      return;
    }

    if (widget.task == null) {
      // Yeni görev oluştur
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        createdAt: DateTime.now(),
        dueDate: _selectedDueDate,
        priority: _selectedPriority,
        category: _selectedCategory,
      );
      widget.db.addTask(newTask);
    } else {
      // Görevi güncelle
      final updatedTask = widget.task!.copyWith(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        dueDate: _selectedDueDate,
        priority: _selectedPriority,
        category: _selectedCategory,
      );
      widget.db.updateTask(updatedTask);
    }

    Navigator.of(context).pop(true);
  }

  Future<void> _selectDueDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDueDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNewTask = widget.task == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNewTask ? 'Yeni Görev' : 'Görevi Düzenle'),
        actions: [
          if (!isNewTask)
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Görevi Sil?'),
                    content: Text('Bu işlem geri alınamaz.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('İptal'),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.db.deleteTask(widget.task!.id);
                          Navigator.pop(context);
                          Navigator.pop(context, true);
                        },
                        child: Text('Sil', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TodoConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Başlık
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Görev başlığı',
                prefixIcon: Icon(Icons.title, color: TodoConstants.accentColor),
              ),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: TodoConstants.paddingMedium),

            // Açıklama
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Açıklama (opsiyonel)',
                prefixIcon: Icon(Icons.description, color: TodoConstants.accentColor),
              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: TodoConstants.paddingMedium),

            // Kategori
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TodoConstants.accentColor),
                borderRadius: TodoConstants.borderRadius,
              ),
              padding: EdgeInsets.all(TodoConstants.paddingSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kategori', style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: TodoConstants.paddingSmall),
                  Wrap(
                    spacing: TodoConstants.paddingSmall,
                    runSpacing: TodoConstants.paddingSmall,
                    children: TaskCategory.values.map((category) {
                      return ChoiceChip(
                        label: Text('${category.emoji} ${category.label}'),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          setState(() => _selectedCategory = category);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: TodoConstants.paddingMedium),

            // Öncelik
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TodoConstants.accentColor),
                borderRadius: TodoConstants.borderRadius,
              ),
              padding: EdgeInsets.all(TodoConstants.paddingSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Öncelik', style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: TodoConstants.paddingSmall),
                  Wrap(
                    spacing: TodoConstants.paddingSmall,
                    runSpacing: TodoConstants.paddingSmall,
                    children: TaskPriority.values.map((priority) {
                      return ChoiceChip(
                        label: Text(priority.displayName),
                        selected: _selectedPriority == priority,
                        onSelected: (selected) {
                          setState(() => _selectedPriority = priority);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: TodoConstants.paddingMedium),

            // Bitiş tarihi
            ListTile(
              title: Text('Bitiş Tarihi'),
              subtitle: Text(
                _selectedDueDate == null
                    ? 'Tarih seçilmedi'
                    : DateFormat('d MMMM yyyy', 'tr_TR').format(_selectedDueDate!),
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: _selectDueDate,
            ),
            SizedBox(height: TodoConstants.paddingMedium),

            // Kaydet Butonu
            ElevatedButton(
              onPressed: _saveTask,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                isNewTask ? 'Görev Oluştur' : 'Değişiklikleri Kaydet',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
