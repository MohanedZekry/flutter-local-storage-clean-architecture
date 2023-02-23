part of 'tasks_bloc.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = _Loading;
  const factory TasksState.loaded(List<TasksModel> tasks) = _Loaded;
  const factory TasksState.error() = _Failed;
}
