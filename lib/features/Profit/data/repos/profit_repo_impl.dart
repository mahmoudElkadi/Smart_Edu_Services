import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Profit/data/repos/profit_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../models/profit_model.dart';

class ProfitRepoImpl implements ProfitRepo {
  @override
  Future<ProfitModel> customerProfits() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.profitUrl}/customer');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var profits = ProfitModel.fromJson(jsonDecode(response.body));
      customerProfitId =
          ProfitModel.fromJson(jsonDecode(response.body)).profitSystem?.id;
      return profits;
    } else {
      throw Exception("failed to get Profit");
    }
  }

  @override
  Future<ProfitModel> specialistProfits() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.profitUrl}/specialist');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var profits = ProfitModel.fromJson(jsonDecode(response.body));
      specialistProfitId =
          ProfitModel.fromJson(jsonDecode(response.body)).profitSystem?.id;

      return profits;
    } else {
      throw Exception("failed to get Profit");
    }
  }

  @override
  Future<bool> editProfits({
    required String type,
    required String id,
    required String max,
    required String min,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'minimum': min, 'maximum': max};
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.profitUrl}/$type/$id');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));
    print(uri);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("failed to get Profit");
    }
  }
}
