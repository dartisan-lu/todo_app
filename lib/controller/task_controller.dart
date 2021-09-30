import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/domain/status.dart';

import '../domain/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void add(Task n) {
    tasks.add(n);
  }

  void changeStatus(Task task, Status newStatus) {
    var old = tasks.map((e) {
      if (e.key == task.key) {
        e.status = newStatus;
      }
      return e;
    }).toList();
    tasks.value = old;
  }

  @override
  void onInit() {
    List? storedTask = GetStorage().read<List>('tasks');

    if (storedTask != null) {
      tasks = storedTask.map((e) => Task.fromJson(e)).toList().obs;
    }

    ever(tasks, (_) {
      GetStorage().write('tasks', tasks.toList());
    });

    super.onInit();
  }
}
