import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/Bloc_Cubit/task_data.dart';
import 'task_tile.dart';
import 'task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskData, List<Task>>(
      builder: (context, tasks) {
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                context.read<TaskData>().updateTask(task);
              },
              longPressCallback: () {
                context.read<TaskData>().deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
