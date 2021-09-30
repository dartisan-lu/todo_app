import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/domain/task.dart';
import 'package:todo_app/view/widgets/task_list.dart';

class TodoScaffold extends StatelessWidget {
  const TodoScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    addTask(BuildContext context) {
      TextEditingController tc = TextEditingController();
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Task'),
              content: Column(
                children: [
                  const Text('Enter a title for the new task:'),
                  TextField(controller: tc)
                ],
              ),
              actions: [
                MaterialButton(
                    child: const Text("ADD"),
                    onPressed: () {
                      Navigator.of(context).pop(tc.text.toString());
                    })
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: const TaskList(),
      floatingActionButton: Material(
        child: IconButton(
            onPressed: () => addTask(context).then(
                (value) => {taskController.tasks.add(Task.newTask(value))}),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        color: Colors.blue,
        type: MaterialType.circle,
      ),
    );
  }
}
