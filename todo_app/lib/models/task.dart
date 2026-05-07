// Görev önceliği
enum TaskPriority {
  low('Düşük'),
  medium('Orta'),
  high('Yüksek'),
  urgent('Acil');

  final String label;
  const TaskPriority(this.label);

  String get displayName {
    switch (this) {
      case TaskPriority.low:
        return 'Düşük';
      case TaskPriority.medium:
        return 'Orta';
      case TaskPriority.high:
        return 'Yüksek';
      case TaskPriority.urgent:
        return 'Acil';
    }
  }
}

// Görev kategorileri
enum TaskCategory {
  work('İş', '💼'),
  personal('Kişisel', '👤'),
  shopping('Alışveriş', '🛒'),
  health('Sağlık', '❤️'),
  education('Eğitim', '📚'),
  other('Diğer', '⭐');

  final String label;
  final String emoji;
  const TaskCategory(this.label, this.emoji);
}

// Task sınıfı
class Task {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? dueDate;
  final TaskPriority priority;
  final TaskCategory category;
  final DateTime? completedAt;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.dueDate,
    this.priority = TaskPriority.medium,
    this.category = TaskCategory.other,
    this.completedAt,
  });

  // JSON'a dönüştür
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'priority': priority.toString(),
      'category': category.toString(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  // JSON'dan oluştur
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      priority: _parsePriority(json['priority']),
      category: _parseCategory(json['category']),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
    );
  }

  // Copy with
  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? dueDate,
    TaskPriority? priority,
    TaskCategory? category,
    DateTime? completedAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

TaskPriority _parsePriority(String? value) {
  if (value == null) return TaskPriority.medium;
  return TaskPriority.values
      .firstWhere((e) => e.toString() == value, orElse: () => TaskPriority.medium);
}

TaskCategory _parseCategory(String? value) {
  if (value == null) return TaskCategory.other;
  return TaskCategory.values
      .firstWhere((e) => e.toString() == value, orElse: () => TaskCategory.other);
}
