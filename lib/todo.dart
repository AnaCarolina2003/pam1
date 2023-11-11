class Todo {
  // adicionar _ antes do método ou atributo -> privado, se não, é privado
  final String title;
  final String responsible;
  final String dueDate;
  final String status;

  Todo(
      {required this.title,
      required this.responsible,
      required this.dueDate,
      required this.status});
}
