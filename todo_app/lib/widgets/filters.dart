import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';
import 'package:todo_app/models/task.dart';

class CategoryFilter extends StatefulWidget {
  final Function(TaskCategory?) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.onCategorySelected,
  });

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  TaskCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TodoConstants.paddingMedium),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Tüm kategori
            _buildCategoryChip(
              label: 'Tümü',
              emoji: '📋',
              isSelected: _selectedCategory == null,
              onTap: () {
                setState(() => _selectedCategory = null);
                widget.onCategorySelected(null);
              },
            ),
            SizedBox(width: TodoConstants.paddingSmall),
            // Diğer kategoriler
            ...TaskCategory.values.map((category) {
              return Padding(
                padding: EdgeInsets.only(right: TodoConstants.paddingSmall),
                child: _buildCategoryChip(
                  label: category.label,
                  emoji: category.emoji,
                  isSelected: _selectedCategory == category,
                  onTap: () {
                    setState(() => _selectedCategory = category);
                    widget.onCategorySelected(category);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required String emoji,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 6),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: TodoConstants.white,
      selectedColor: TodoConstants.accentColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: TodoConstants.borderRadius,
        side: BorderSide(
          color: isSelected ? TodoConstants.darkGreen : TodoConstants.accentColor,
          width: isSelected ? 2 : 1.5,
        ),
      ),
    );
  }
}

class PriorityFilter extends StatefulWidget {
  final Function(TaskPriority?) onPrioritySelected;

  const PriorityFilter({
    super.key,
    required this.onPrioritySelected,
  });

  @override
  State<PriorityFilter> createState() => _PriorityFilterState();
}

class _PriorityFilterState extends State<PriorityFilter> {
  TaskPriority? _selectedPriority;

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TodoConstants.paddingMedium),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildPriorityChip(
              label: 'Tüm Öncelikler',
              color: TodoConstants.darkGreen,
              isSelected: _selectedPriority == null,
              onTap: () {
                setState(() => _selectedPriority = null);
                widget.onPrioritySelected(null);
              },
            ),
            SizedBox(width: TodoConstants.paddingSmall),
            ...TaskPriority.values.map((priority) {
              return Padding(
                padding: EdgeInsets.only(right: TodoConstants.paddingSmall),
                child: _buildPriorityChip(
                  label: priority.displayName,
                  color: _getPriorityColor(priority),
                  isSelected: _selectedPriority == priority,
                  onTap: () {
                    setState(() => _selectedPriority = priority);
                    widget.onPrioritySelected(priority);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityChip({
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: color.withOpacity(0.15),
      selectedColor: color.withOpacity(0.3),
      labelStyle: TextStyle(
        color: color,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: TodoConstants.borderRadius,
        side: BorderSide(
          color: color,
          width: isSelected ? 2 : 1.5,
        ),
      ),
    );
  }
}
