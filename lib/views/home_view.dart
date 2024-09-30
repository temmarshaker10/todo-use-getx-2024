import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_use_getx/views/add_todo_view.dart';
import '../controllers/todo_controller.dart';

class HomeView extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List 2024'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(AddTodoView());
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            var todo = todoController.todos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isCompleted,
                onChanged: (value) {
                  todoController.toggleTodoStatus(index);
                },
              ),
              title: Text(
                todo.task,
                style: TextStyle(
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  todoController.removeTodoAt(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
