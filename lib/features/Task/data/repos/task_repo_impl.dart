import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Task/data/model/task_res_model.dart';
import 'package:smart/features/Task/data/repos/task_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';

class TaskRepoImpl implements TaskRepo {
  @override
  Future<TaskModel> myTasks(int? page) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '/api/task',
        query: 'page=${page ?? 1}');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var tasks = TaskModel.fromJson(jsonDecode(response.body));
      return tasks;
    } else {
      throw Exception("failed to get task");
    }
  }

  @override
  Future<TaskModel> filterTasks(
      String? status,
      String? speciality,
      String? country,
      String? start,
      String? end,
      String? freelancer,
      String? client,
      String? user,
      String? sort) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'status': status,
      'speciality': speciality,
      'country': country,
      'start': start,
      'end': end,
      'freelancer': freelancer,
      'client': client,
      'user': user,
      'sort': sort,
    };

    var uri = Uri(
      scheme: 'http',
      host: Config.localHost,
      port: Config.port,
      path: "${Config.taskUrl}/filter/result/",
    );
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var tasks = TaskModel.fromJson(jsonDecode(response.body));
      return tasks;
    } else {
      throw Exception("failed to get task");
    }
  }
}
