import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../models/one_user_model.dart';
import '../models/user_model.dart';
import 'User_repo.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<UserModel> allUser() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.userUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var User = UserModel.fromJson(jsonDecode(response.body));
      return User;
    } else {
      throw Exception("failed to get User");
    }
  }

  @override
  Future<int> createUser(String fullName, String userName, String password,
      String phone, String userType, String country, String userRole) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'fullName': fullName,
      'userName': userName,
      'password': password,
      'phone': phone,
      'userType': userType,
      'country': country,
      'userRole': userRole,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.userUrl);
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
      throw Exception("failed to get User");
    }
  }

  @override
  Future<int> deleteUser(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update User");
    }
  }

  //
  @override
  Future<int> updateUser(
    String id,
    String fullName,
    String userName,
    String userRole,
    String userType,
    String country,
    String phone,
    String? speciality,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'fullName': fullName,
      'userName': userName,
      'userRole': userRole,
      'userType': userType,
      'country': country,
      'phone': phone,
      'speciality': speciality,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/$id');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      Get.snackbar(response.body.toString(), "");
      return 2;
    } else {
      throw Exception("failed to update User");
    }
  }

  @override
  Future<int> updateInfo(
    String id,
    String fullName,
    String userName,
    String userRole,
    String country,
    String phone,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'fullName': fullName,
      'userName': userName,
      'userRole': userRole,
      'country': country,
      'phone': phone,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/$id');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      Get.snackbar(response.body.toString(), "");
      return 2;
    } else {
      throw Exception("failed to update User");
    }
  }

  //
  @override
  Future<OneUserModel> detailsUser(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var specialty = OneUserModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

  @override
  Future<UserModel> filterUser({String? sort, String? role}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'sort': sort,
      'role': role,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.userUrl}/sort/filter');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var specialty = UserModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

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
//       path: '${Config.UserUrl}/$id');
//   http.Response response = await http.delete(uri, headers: requestHeaders);
//   print(uri);
//
//   if (response.UserCode == 200) {
//     return 0;
//   } else if (response.UserCode == 400) {
//     return 1;
//   } else {
//     throw Exception("failed to update User");
//   }
// }
}
