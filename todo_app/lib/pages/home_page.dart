import 'package:flutter/material.dart' hide SearchBar;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/statistics_page.dart';
import 'package:todo_app/pages/settings_page.dart';
import 'package:todo_app/pages/task_detail_page.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/widgets/task_card.dart';
import 'package:todo_app/widgets/empty_state.dart';
import 'package:todo_app/widgets/search_bar.dart';
import 'package:todo_app/widgets/filters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  final ToDoDatabase db = ToDoDatabase();
  final _controller = TextEditingController();

  int _currentIndex = 0;
  String _searchQuery = '';
  TaskCategory? _selectedCategory;
  TaskPriority? _selectedPriority;

  @override
  void initState() {
    db.loadTasks();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTaskCompletion(String taskId) {
    setState(() {
      db.toggleTaskCompletion(taskId);
    });
    _showFeedback('Görev durumu güncellendi');
  }

  void _deleteTask(String taskId, String taskName) {
    db.deleteTask(taskId);
    setState(() {});
    _showFeedback('\'$taskName\' silindi');
  }

  void _createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          my_controller: _controller,
          onSave: () {
            if (_controller.text.trim().isNotEmpty) {
              final newTask = Task(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                title: _controller.text.trim(),
                createdAt: DateTime.now(),
              );
              setState(() {
                db.addTask(newTask);
              });
              _controller.clear();
              Navigator.of(context).pop();
              _showFeedback('Görev eklendi ✓');
            }
          },
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
        );
      },
    );
  }

  void _openTaskDetail([Task? task]) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TaskDetailPage(task: task, db: db),
      ),
    );

    if (result == true) {
      setState(() {
        db.loadTasks();
      });
      _showFeedback(task == null ? 'Görev eklendi ✓' : 'Görev güncellendi ✓');
    }
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: TodoConstants.darkGreen,
      ),
    );
  }

  List<Task> _getFilteredTasks() {
    List<Task> tasks = db.tasks;

    // Kategori filtresi
    if (_selectedCategory != null) {
      tasks = tasks.where((t) => t.category == _selectedCategory).toList();
    }

    // Öncelik filtresi
    if (_selectedPriority != null) {
      tasks = tasks.where((t) => t.priority == _selectedPriority).toList();
    }

    // Arama filtresi
    if (_searchQuery.isNotEmpty) {
      tasks = db.searchTasks(_searchQuery);
    }

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _getFilteredTasks();

    return Scaffold(
      appBar: AppBar(
        title: Text(TodoConstants.appTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: TodoConstants.appTitle,
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2026  Todo App',
              );
            },
          ),
        ],
      ),
      body: [
        // Tab 0: Görevler
        Column(
          children: [
            SearchBar(
              onSearch: (query) {
                setState(() => _searchQuery = query);
              },
              onClear: () {
                setState(() => _searchQuery = '');
              },
            ),
            if (db.tasks.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TodoConstants.paddingMedium),
                child: CategoryFilter(
                  onCategorySelected: (category) {
                    setState(() => _selectedCategory = category);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TodoConstants.paddingMedium),
                child: PriorityFilter(
                  onPrioritySelected: (priority) {
                    setState(() => _selectedPriority = priority);
                  },
                ),
              ),
            ],
            Expanded(
              child: filteredTasks.isEmpty
                  ? EmptyState(
                      message: 'Görev bulunamadı',
                      subtitle: _searchQuery.isNotEmpty
                          ? 'Farklı bir arama terimi deneyin'
                          : 'Yeni görev eklemek için + butonuna basın',
                      icon: Icons.search,
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(TodoConstants.paddingMedium),
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: TodoConstants.paddingSmall),
                          child: GestureDetector(
                            onTap: () => _openTaskDetail(task),
                            child: TaskCard(
                              taskName: task.title,
                              isCompleted: task.isCompleted,
                              onChanged: (_) => _toggleTaskCompletion(task.id),
                              onDelete: () => _deleteTask(task.id, task.title),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),

        // Tab 1: İstatistikler
        StatsPanel(db: db),

        // Tab 2: Ayarlar
        SettingsPage(),
      ][_currentIndex],
      
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: _createNewTask,
              child: Icon(Icons.add),
            )
          : null,
      
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.assignment),
            label: 'Görevler',
          ),
          NavigationDestination(
            icon: Icon(Icons.show_chart),
            label: 'İstatistikler',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}

class StatsPanel extends StatelessWidget {
  final ToDoDatabase db;

  const StatsPanel({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return StatisticsPage(db: db);
  }
}