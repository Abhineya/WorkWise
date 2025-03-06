import 'package:work_wise/features/home/domain/task_entity.dart';

import '../../data/repository/task_repository.dart';

class TaskUseCases {
  final TaskRepository repository;

  TaskUseCases(this.repository);

  Stream<List<TaskEntity>> getTasks() => repository.getTasks();
  Future<void> addTask(TaskEntity task) => repository.addTask(task);
  Future<void> updateTask(TaskEntity task) => repository.updateTask(task);
  Future<void> deleteTask(String taskId) => repository.deleteTask(taskId);
}
