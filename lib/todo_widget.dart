import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/todo", arguments: todo),
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Text(todo.title),
              ),
              Text(todo.status),
            ],
          ),
        ),
      ),
    );
  }
}
