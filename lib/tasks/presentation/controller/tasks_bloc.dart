import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../data/models/tasks_model.dart';
import '../../domain/use_cases/get_all_tasks_use_case.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';
part 'tasks_bloc.freezed.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetAllTasksUseCase getAllTasksUseCase;
  TasksBloc({required this.getAllTasksUseCase}) : super(const TasksState.initial()) {
    on<TasksEvent>((event, emit) async {
      if(event is GetAllTasksEvent){
        emit(const TasksState.loading());
        final response = await getAllTasksUseCase(const DefaultParams());
        response.fold(
                (l) => emit(const TasksState.error()),
                (r) => emit(TasksState.loaded(r)));
      }

    });
  }
}
