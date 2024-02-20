import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Country/data/repos/country_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/country_model.dart';

class CountryRepoImpl implements CountryRepo {
  @override
  Future<CountryModel> getAllCountry() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.countryUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var country = CountryModel.fromJson(jsonDecode(response.body));
      return country;
    } else {
      throw Exception("failed to get Speciality");
    }
  }

  @override
  Future<int> createCountry(String countryName) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'countryName': countryName};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.countryUrl);
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
      throw Exception("failed to create Country");
    }
  }

  @override
  Future<int> deleteCountry(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.countryUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to delete Speciality");
    }
  }
}
