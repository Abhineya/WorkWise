import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_wise/features/home/presentation/bloc/task_bloc.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.status == TaskStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Text(task.priority),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    // context.read<TaskBloc>().add(
                    //   UpdateTask(task: task.copyWith(isCompleted: value!)),
                    // );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
