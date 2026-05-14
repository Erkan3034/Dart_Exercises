import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/data/database.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: TodoConstants.borderRadius),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
          ),
          borderRadius: TodoConstants.borderRadius,
        ),
        padding: EdgeInsets.all(TodoConstants.paddingMedium),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            SizedBox(height: TodoConstants.paddingSmall),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: TodoConstants.paddingSmall),
            Text(
              title,
              style: TextStyle(
                color: TodoConstants.lightText,
                fontSize: TodoConstants.smallFontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  final ToDoDatabase db;

  const StatisticsPage({
    super.key,
    required this.db,
  });

  @override
  Widget build(BuildContext context) {
    final stats = db.getStatistics();
    final upcomingTasks = db.getUpcomingTasks();
    final overdueTasks = db.getOverdueTasks();

    return SingleChildScrollView(
      padding: EdgeInsets.all(TodoConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // İstatistikler başlığı
          Text(
            'İstatistikler',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: TodoConstants.paddingMedium),

          // İstatistik Kartları
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: TodoConstants.paddingSmall,
            mainAxisSpacing: TodoConstants.paddingSmall,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              StatsCard(
                title: 'Toplam Görev',
                value: stats['total'].toString(),
                color: TodoConstants.darkGreen,
                icon: Icons.task_alt,
              ),
              StatsCard(
                title: 'Tamamlanan',
                value: stats['completed'].toString(),
                color: Colors.green,
                icon: Icons.check_circle,
              ),
              StatsCard(
                title: 'Açık Görevler',
                value: stats['active'].toString(),
                color: Colors.orange,
                icon: Icons.schedule,
              ),
              StatsCard(
                title: 'Tamamlanma %',
                value: '${stats['completionRate']}%',
                color: Colors.blue,
                icon: Icons.trending_up,
              ),
            ],
          ),
          SizedBox(height: TodoConstants.paddingLarge),

          // Acil Görevler
          if (stats['urgentTasks'] > 0) ...[
            _buildSectionTitle(context, 'Acil Görevler', Icons.warning),
            Container(
              padding: EdgeInsets.all(TodoConstants.paddingMedium),
              decoration: BoxDecoration(
                color: Color(0xFFFFEBEE),
                border: Border.all(color: Colors.red),
                borderRadius: TodoConstants.borderRadius,
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 24),
                  SizedBox(width: TodoConstants.paddingMedium),
                  Text(
                    '${stats['urgentTasks']} acil görev var',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: TodoConstants.paddingMedium),
          ],

          // Geç Kalan Görevler
          if (overdueTasks.isNotEmpty) ...[
            _buildSectionTitle(context, 'Geç Kalan Görevler', Icons.schedule),
            Container(
              padding: EdgeInsets.all(TodoConstants.paddingMedium),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3E0),
                border: Border.all(color: Colors.orange),
                borderRadius: TodoConstants.borderRadius,
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.orange, size: 24),
                  SizedBox(width: TodoConstants.paddingMedium),
                  Text(
                    '${overdueTasks.length} görev zamanında tamamlanmadı',
                    style:
                        TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: TodoConstants.paddingMedium),
          ],

          // Sıradaki Görevler
          if (upcomingTasks.isNotEmpty) ...[
            _buildSectionTitle(context, 'Sıradaki Görevler', Icons.calendar_today),
            ...upcomingTasks.take(5).map((task) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.assignment, color: TodoConstants.accentColor),
                  title: Text(task.title),
                  trailing: Text(
                    '${task.dueDate?.day}/${task.dueDate?.month}',
                    style: TextStyle(fontSize: TodoConstants.smallFontSize),
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: TodoConstants.paddingSmall),
      child: Row(
        children: [
          Icon(icon, color: TodoConstants.darkGreen),
          SizedBox(width: TodoConstants.paddingSmall),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
