import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final VoidCallback onClear;

  const SearchBar({
    super.key,
    required this.onSearch,
    required this.onClear,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TodoConstants.paddingMedium),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Görev ara...',
          prefixIcon: Icon(Icons.search, color: TodoConstants.accentColor),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    widget.onClear();
                  },
                )
              : null,
          filled: true,
          fillColor: TodoConstants.white,
          border: OutlineInputBorder(
            borderRadius: TodoConstants.borderRadius,
            borderSide: BorderSide(color: TodoConstants.accentColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: TodoConstants.borderRadius,
            borderSide: BorderSide(color: TodoConstants.accentColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: TodoConstants.borderRadius,
            borderSide: BorderSide(color: TodoConstants.darkGreen, width: 2),
          ),
        ),
        onChanged: (value) {
          widget.onSearch(value);
        },
      ),
    );
  }
}
