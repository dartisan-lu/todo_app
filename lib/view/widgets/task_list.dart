import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/domain/status.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return Obx(
      () => ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (ctx, idx) => Card(
                child: ListTile(
                  title: Text(taskController.tasks[idx].title),
                  trailing: Wrap(children: [
                    taskController.tasks[idx].status == Status.created
                        ? IconButton(
                            onPressed: () => taskController.changeStatus(
                                taskController.tasks[idx], Status.finished),
                            icon: const Icon(Icons.check, color: Colors.green))
                        : IconButton(
                            onPressed: () => taskController.changeStatus(
                                taskController.tasks[idx], Status.created),
                            icon: const Icon(Icons.undo, color: Colors.blue)),
                    IconButton(
                        onPressed: () => taskController.tasks.remove(taskController.tasks[idx]),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ]),
                ),
              )),
    );
  }
}
