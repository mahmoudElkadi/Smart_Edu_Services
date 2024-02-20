import 'package:smart/features/Task%20page/data/model/customer_model.dart';

import '../model/details_task_model.dart';

abstract class DetailsTaskRepo {
  Future<DetailsTaskModel> detailsTasks(String id);
  Future<CustomerModel> customerService();
  Future<int> updateTask(
      String id,
      String title,
      String description,
      String channel,
      String client,
      String freelancer,
      String speciality,
      String taskStatus,
      String deadline,
      String createdBy,
      String acceptedBy,
      String taskCurrency,
      String paid,
      String cost,
      String profitAmount);

  Future<int> addTask(
    String title,
    String description,
    String channel,
    String client,
    String shareWith,
    String speciality,
    String status,
    String deadline,
    String taskCurrency,
    String paid,
  );
}
