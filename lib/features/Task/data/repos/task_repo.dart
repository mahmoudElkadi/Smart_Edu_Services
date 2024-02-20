import '../model/task_res_model.dart';

abstract class TaskRepo {
  Future<TaskModel> myTasks(int? page);
  Future<TaskModel> filterTasks(
      String? status,
      String? speciality,
      String? country,
      String? start,
      String? end,
      String? freelancer,
      String? client,
      String? user,
      String? sort);
}
