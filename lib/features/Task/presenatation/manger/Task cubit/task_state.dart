import 'package:smart/features/Task/data/model/task_res_model.dart';

class TaskState {}

class TaskInitial extends TaskState {}

class TaskSuccess extends TaskState {}

class TasksLoading extends TaskState {} // Renamed for clarity

class TasksLoaded extends TaskState {
  final List<Task> tasks;
  final bool hasMore;

  TasksLoaded(this.tasks, this.hasMore);
}

class TasksError extends TaskState {
  final String message;

  TasksError(this.message);
}

class ViewChange extends TaskState {}

class GetTaskLoading extends TaskState {}

class LoadMore extends TaskState {}

class TasksLoadingMore extends TaskState {}

class GetTaskSuccess extends TaskState {}

class UserSuccessSpeciality extends TaskState {}

class UserSuccessCountry extends TaskState {}

class UserSuccessCurrency extends TaskState {}

class UserSuccessFreelancer extends TaskState {}

class UserSuccessClient extends TaskState {}

class UserSuccessStatus extends TaskState {}

class UserSuccess extends TaskState {}

class FilterTaskSuccess extends TaskState {}

class FilterTaskLoading extends TaskState {}

class IsLoadMoreTrue extends TaskState {}

class IsLoadMore extends TaskState {}
