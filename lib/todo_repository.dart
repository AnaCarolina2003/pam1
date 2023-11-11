import 'package:todo/todo.dart';

class TodoRepository {
  static List<Todo> list() {
    return <Todo>[
      Todo(
        title: "Dormir",
        responsible: "Eu",
        dueDate: "09/11/2023",
        status: "DONE",
      ),
      Todo(
          title: "Assistir aula de PMI",
          responsible: "Eu",
          dueDate: "10/11/2023",
          status: "DOING"),
      Todo(
        title: "Dormir",
        responsible: "Eu",
        dueDate: "11/11/2023",
        status: "TO-DO",
      ),
      Todo(
        title: "Dormir",
        responsible: "Eu",
        dueDate: "12/11/2023",
        status: "TO-DO",
      ),
    ];
  }
}
