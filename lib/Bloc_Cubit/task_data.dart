import 'package:flutter_bloc/flutter_bloc.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends Cubit<List<Task>> {
  TaskData() : super([]);

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(state);
  }

  int get taskCount {
    return state.length;
  }

  void addTask(Task task) {
    final updatedTasks = List<Task>.from(state)..add(task);
    emit(updatedTasks);
  }

  void updateTask(Task task) {
    final updatedTasks = state.map((t) {
      if (t == task) {
        t.toggleDone();
      }
      return t;
    }).toList();
    emit(updatedTasks);
  }

  void deleteTask(Task task) {
    final updatedTasks = List<Task>.from(state)..remove(task);
    emit(updatedTasks);
  }
}
