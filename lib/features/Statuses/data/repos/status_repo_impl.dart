import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Statuses/data/model/one_status.dart';
import 'package:smart/features/Statuses/data/repos/status_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/status_model.dart';

class StatusRepoImpl implements StatusRepo {
  @override
  Future<StatusModel> allStatus() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.statusUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var Status = StatusModel.fromJson(jsonDecode(response.body));
      return Status;
    } else {
      throw Exception("failed to get Status");
    }
  }

  @override
  Future<int> createStatus(String name, String role) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'name': name, 'role': role};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.statusUrl);
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
      throw Exception("failed to get Status");
    }
  }

  @override
  Future<int> deleteStatus(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.statusUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Status");
    }
  }

  @override
  Future<OneStatusModel> detailsStatus(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.statusUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var specialty = OneStatusModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

  //
  @override
  Future<int> updateStatus(String id, String name, String role) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'name': name, 'role': role};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.statusUrl}/$id');
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
      throw Exception("failed to update Status");
    }
  }
  //
  // // @override
  // // Future<OneStatusModel> detailsSpecialty(String id) async {
  // //   Map<String, String> requestHeaders = {
  // //     'Content-Type': 'application/json',
  // //     'Authorization': 'Bearer $token'
  // //   };
  // //   var uri = Uri(
  // //       scheme: 'http',
  // //       host: Config.localHost,
  // //       port: Config.port,
  // //       path: '${Config.StatusUrl}/$id');
  // //   http.Response response = await http.get(
  // //     uri,
  // //     headers: requestHeaders,
  // //   );
  // //
  // //   if (response.statusCode == 200) {
  // //     var specialty = OneStatusModel.fromJson(jsonDecode(response.body));
  // //     return specialty;
  // //   } else {
  // //     throw Exception("failed to get Specialty");
  // //   }
  // // }
  //
  // @override
  // Future<int> deleteSpecialty(String id) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //
  //   var uri = Uri(
  //       scheme: 'http',
  //       host: Config.localHost,
  //       port: Config.port,
  //       path: '${Config.statusUrl}/$id');
  //   http.Response response = await http.delete(uri, headers: requestHeaders);
  //   print(uri);
  //
  //   if (response.statusCode == 200) {
  //     return 0;
  //   } else if (response.statusCode == 400) {
  //     return 1;
  //   } else {
  //     throw Exception("failed to update Status");
  //   }
  // }
}
