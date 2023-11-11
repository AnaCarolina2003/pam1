import 'package:flutter/material.dart';
import 'package:todo/todo_repository.dart';
import 'package:todo/todo_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = TodoRepository.list();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        itemCount: todos.length,
        itemBuilder: ((context, index) => TodoWidget(todo: todos[index])),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
