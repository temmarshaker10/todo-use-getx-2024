import 'package:get/get.dart';

class Todo {
  String task;
  bool isCompleted;

  Todo({
    required this.task,
    this.isCompleted = false,
  });
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String task) {
    if (task.isNotEmpty) {
      todos.add(Todo(task: task));
    }
  }

  void toggleTodoStatus(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    todos.refresh();
  } //....

  void removeTodoAt(int index) {
    todos.removeAt(index);
  }
}
