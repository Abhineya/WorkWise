import 'package:work_wise/features/home/domain/task_entity.dart';


class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.dueDate,
    required super.priority,
    required super.isCompleted,
  });

  factory TaskModel.fromMap(Map<String, dynamic> data, String id) {
    return TaskModel(
      id: id,
      title: data['title'],
      description: data['description'],
      dueDate: DateTime.parse(data['dueDate']),
      priority: data['priority'],
      isCompleted: data['status'] == 'completed',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
      'status': isCompleted ? 'completed' : 'incomplete',
    };
  }
}
