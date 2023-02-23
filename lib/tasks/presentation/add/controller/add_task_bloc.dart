import 'package:bloc/bloc.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/use_cases/add_task_use_case.dart';
part 'add_task_event.dart';
part 'add_task_state.dart';
part 'add_task_bloc.freezed.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {

  final AddTaskUseCase addTaskUseCase;

  AddTaskBloc({required this.addTaskUseCase}) : super(const AddTaskState.initial()) {
    on<AddTaskEvent>((event, emit) async {
      if(event is AddNewTaskEvent){
        emit(const AddTaskState.loading());
        final result = await addTaskUseCase(event.tasksModel);
        result.fold(
                (l) => emit(const AddTaskState.failed()),
                (r) => emit(const AddTaskState.success())
        );
      }
    });
  }
}
