import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Specialities/data/models/one_specialty.dart';
import 'package:smart/features/Specialities/data/repos/specialty_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../models/speciality_model.dart';

class SpecialityRepoImpl implements SpecialityRepo {
  @override
  Future<SpecialityModel> allSpeciality() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.specialityUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var speciality = SpecialityModel.fromJson(jsonDecode(response.body));
      return speciality;
    } else {
      throw Exception("failed to get Speciality");
    }
  }

  @override
  Future<int> createSpecialty(String sub, String specialty) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'sub_speciality': sub,
      'speciality': specialty
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.specialityUrl);
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
      throw Exception("failed to get Speciality");
    }
  }

  @override
  Future<int> updateSpecialty(String id, String sub, String specialty) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'sub_speciality': sub,
      'speciality': specialty
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.specialityUrl}/$id');
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
      throw Exception("failed to update Speciality");
    }
  }

  @override
  Future<OneSpecialityModel> detailsSpecialty(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.specialityUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var specialty = OneSpecialityModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

  @override
  Future<int> deleteSpecialty(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.specialityUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Speciality");
    }
  }
}
