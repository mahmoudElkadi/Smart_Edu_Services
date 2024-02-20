import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/freelancer_model.dart';
import '../model/one_freelancer_model.dart';
import 'freelancer_repo.dart';

class FreelancerRepoImpl implements FreelancerRepo {
  @override
  Future<FreelancerModel> allFreelancer() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.freelancerUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var freelancer = FreelancerModel.fromJson(jsonDecode(response.body));
      return freelancer;
    } else {
      throw Exception("failed to get Freelancer");
    }
  }

  @override
  Future<int> createFreelancer(
      String name,
      String email,
      String phone,
      String country,
      String currency,
      String speciality,
      String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'email': email,
      'country': country,
      'currency': currency,
      'speciality': speciality,
      'password': password,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.freelancerUrl);
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
      throw Exception("failed to get Freelancer");
    }
  }

  @override
  Future<int> deleteFreelancer(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.freelancerUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Freelancer");
    }
  }

  //
  @override
  Future<int> updateFreelancer(String id, String name, String email,
      String phone, String country, String currency, String speciality) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'email': email,
      'country': country,
      'currency': currency,
      'speciality': speciality,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.freelancerUrl}/$id');
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

  //
  @override
  Future<OneFreelancerModel> detailsFreelancer(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.freelancerUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var specialty = OneFreelancerModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

  @override
  Future<FreelancerModel> filterFreelancer(
      {String? sort, String? speciality}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'sort': sort,
      'speciality': speciality,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.freelancerUrl}/sort/filter');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var specialty = FreelancerModel.fromJson(jsonDecode(response.body));
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
  //       path: '${Config.FreelancerUrl}/$id');
  //   http.Response response = await http.delete(uri, headers: requestHeaders);
  //   print(uri);
  //
  //   if (response.FreelancerCode == 200) {
  //     return 0;
  //   } else if (response.FreelancerCode == 400) {
  //     return 1;
  //   } else {
  //     throw Exception("failed to update Freelancer");
  //   }
  // }
}
