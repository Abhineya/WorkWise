import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_wise/features/home/data/model/task_model.dart';
import 'package:work_wise/features/home/domain/task_entity.dart';

class TaskRepository {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  Stream<List<TaskEntity>> getTasks() {
    return _taskCollection.orderBy('dueDate').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<void> addTask(TaskEntity task) async {
    await _taskCollection.add(TaskModel(
      id: '',
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      isCompleted: task.isCompleted,
    ).toMap());
  }

  Future<void> updateTask(TaskEntity task) async {
    await _taskCollection.doc(task.id).update(TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      isCompleted: task.isCompleted,
    ).toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await _taskCollection.doc(taskId).delete();
  }
}
