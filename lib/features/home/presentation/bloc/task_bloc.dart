import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:work_wise/features/home/domain/task_entity.dart';
import 'package:work_wise/features/home/domain/usecase/task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCases taskUseCases;

  TaskBloc(this.taskUseCases) : super(TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) {
    emit(state.copyWith(status: TaskStatus.loading));
    taskUseCases.getTasks().listen((tasks) {
      emit(state.copyWith(status: TaskStatus.success, tasks: tasks));
    });
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    await taskUseCases.addTask(event.task);
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    await taskUseCases.updateTask(event.task);
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    await taskUseCases.deleteTask(event.taskId);
  }
}
