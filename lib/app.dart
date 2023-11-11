import 'package:flutter/material.dart';
import 'package:todo/home_page.dart';
import 'package:todo/todo_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDoList",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/todo": (context) => const TodoPage(),
      },
    );
  }
}
