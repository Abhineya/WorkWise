part of 'task_bloc.dart';

enum TaskStatus { initial, loading, success, failure }

@immutable
class TaskState {
  final TaskStatus status;
  final List<TaskEntity> tasks;

  const TaskState({
    this.status = TaskStatus.initial,
    this.tasks = const [],
  });

  TaskState copyWith({
    TaskStatus? status,
    List<TaskEntity>? tasks,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskState &&
        other.status == status &&
        other.tasks == tasks;
  }

  @override
  int get hashCode => status.hashCode ^ tasks.hashCode;
}
