import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task.dart';
import 'dart:convert';

class ToDoDatabase {
  List<String> toDoList = [];
  final _myBox = Hive.box('mybox');

  // Yeni system: JSON tabanlı Task listesi
  List<Task> tasks = [];

  // İlk veri oluştur
  void createInitialData() {
    toDoList = [
      "Make Tutorial",
      "Do Exercise",
    ];
    _saveLegacyData();
  }

  // Veri yükle
  void loadData() {
    final data = _myBox.get("TODOLIST");
    if (data != null) {
      toDoList = List<String>.from(data);
    }

    // Yeni Task sistemi yükle
    loadTasks();
  }

  // Veritabanı güncelle
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

  // ===== YENİ TASK SISTEM =====

  // Tüm görevleri yükle
  void loadTasks() {
    try {
      final tasksJson = _myBox.get("TASKS_LIST");
      if (tasksJson != null) {
        final List<dynamic> decoded = jsonDecode(tasksJson);
        tasks = decoded.map((item) => Task.fromJson(item as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      print("Veri yükleme hatası: $e");
      tasks = [];
    }
  }

  // Tüm görevleri kaydet
  void saveTasks() {
    try {
      final tasksJson = jsonEncode(tasks.map((t) => t.toJson()).toList());
      _myBox.put("TASKS_LIST", tasksJson);
    } catch (e) {
      print("Veri kaydetme hatası: $e");
    }
  }

  // Görev ekle
  void addTask(Task task) {
    tasks.add(task);
    saveTasks();
  }

  // Görevi güncelle
  void updateTask(Task updatedTask) {
    final index = tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      saveTasks();
    }
  }

  // Görevi sil
  void deleteTask(String taskId) {
    tasks.removeWhere((t) => t.id == taskId);
    saveTasks();
  }

  // Görev tamamlama durumunu değiştir
  void toggleTaskCompletion(String taskId) {
    final index = tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      final task = tasks[index];
      tasks[index] = task.copyWith(
        isCompleted: !task.isCompleted,
        completedAt: !task.isCompleted ? DateTime.now() : null,
      );
      saveTasks();
    }
  }

  // Tamamlanan görevler
  List<Task> getCompletedTasks() {
    return tasks.where((t) => t.isCompleted).toList();
  }

  // Açık görevler
  List<Task> getActiveTasks() {
    return tasks.where((t) => !t.isCompleted).toList();
  }

  // Kategori görevleri
  List<Task> getTasksByCategory(TaskCategory category) {
    return tasks.where((t) => t.category == category).toList();
  }

  // Önceliğe göre görevler
  List<Task> getTasksByPriority(TaskPriority priority) {
    return tasks.where((t) => t.priority == priority).toList();
  }

  // Arama
  List<Task> searchTasks(String query) {
    return tasks
        .where((t) =>
            t.title.toLowerCase().contains(query.toLowerCase()) ||
            (t.description?.toLowerCase().contains(query.toLowerCase()) ?? false))
        .toList();
  }

  // İstatistikler
  Map<String, dynamic> getStatistics() {
    final total = tasks.length;
    final completed = getCompletedTasks().length;
    final active = getActiveTasks().length;
    final completionRate =
        total == 0 ? 0.0 : (completed / total * 100).toStringAsFixed(1);

    return {
      'total': total,
      'completed': completed,
      'active': active,
      'completionRate': completionRate,
      'urgentTasks': getTasksByPriority(TaskPriority.urgent).length,
      'highPriority': getTasksByPriority(TaskPriority.high).length,
    };
  }

  // Sıradaki görevler (bugün ve yarın)
  List<Task> getUpcomingTasks() {
    final now = DateTime.now();
    final tomorrow = now.add(Duration(days: 1));

    return tasks
        .where((t) =>
            !t.isCompleted &&
            t.dueDate != null &&
            t.dueDate!.isBefore(tomorrow.add(Duration(days: 1))))
        .toList()
      ..sort((a, b) => (a.dueDate ?? DateTime.now()).compareTo(b.dueDate ?? DateTime.now()));
  }

  // Geç kalan görevler
  List<Task> getOverdueTasks() {
    final now = DateTime.now();
    return tasks
        .where((t) => !t.isCompleted && t.dueDate != null && t.dueDate!.isBefore(now))
        .toList();
  }

  // ===== LEGACY VERİ =====
  void _saveLegacyData() {
    _myBox.put("TODOLIST", toDoList);
  }
}