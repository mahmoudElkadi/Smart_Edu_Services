import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Task%20page/data/model/customer_model.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/details_task_model.dart';
import 'details_task_repo.dart';

class DetailsTaskRepoImpl implements DetailsTaskRepo {
  @override
  Future<DetailsTaskModel> detailsTasks(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '/api/task/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var tasks = DetailsTaskModel.fromJson(jsonDecode(response.body));
      return tasks;
    } else {
      throw Exception("faild to get task");
    }
  }

  @override
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
      String profitAmount) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'channel': channel,
      'client': client,
      'freelancer': freelancer,
      'speciality': speciality,
      'taskStatus': taskStatus,
      'deadline': deadline,
      'created_by': createdBy,
      'accepted_by': acceptedBy,
      'taskCurrency': taskCurrency,
      'paid': paid,
      'cost': cost,
      'profit_amount': profitAmount,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.taskUrl}/$id');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      return 2;
    } else {
      throw Exception("failed to update Freelancer");
    }
  }

  @override
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
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'channel': channel,
      'client': client,
      'speciality': speciality,
      'status': status,
      'deadline': deadline,
      'task_currency': taskCurrency,
      'paid': paid,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.taskUrl);
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      return 2;
    } else {
      throw Exception("failed to Add task");
    }
  }

  @override
  Future<CustomerModel> customerService() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/customerService');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var User = CustomerModel.fromJson(jsonDecode(response.body));
      return User;
    } else {
      throw Exception("failed to get User");
    }
  }
}
