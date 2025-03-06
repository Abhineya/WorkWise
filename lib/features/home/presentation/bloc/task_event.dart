part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final TaskEntity task;
  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final TaskEntity task;
  UpdateTask({required this.task});

  UpdateTask copyWith({TaskEntity? task}) {
    return UpdateTask(task: task ?? this.task);
  }
}

class DeleteTask extends TaskEvent {
  final String taskId;
  DeleteTask(this.taskId);
}
