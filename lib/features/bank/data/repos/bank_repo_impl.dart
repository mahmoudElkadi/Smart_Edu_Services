import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/bank/data/model/one_bank.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/bank_model.dart';
import 'bank_repo.dart';

class BankRepoImpl implements BankRepo {
  @override
  Future<List<BankModel>> getAllBank() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.bankUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var bank = bankModelFromJson(response.body);
      return bank;
    } else {
      throw Exception("failed to get Freelancer");
    }
  }

  @override
  Future<OneBankModel> getOneBank(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.bankUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var oneBank = OneBankModel.fromJson(jsonDecode(response.body));
      return oneBank;
    } else {
      throw Exception("failed to get Bank");
    }
  }

  @override
  Future<int> createBank(String title, String currency, int balance) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'title': title,
      'currency': currency,
      'balance': balance,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.bankUrl);
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
  Future<int> deleteBank(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.bankUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to delete Bank");
    }
  }

  @override
  Future<int> updateBank(
      String? id, String? title, String? currency, int? balance) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'title': title,
      'currency': currency,
      'balance': balance,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.bankUrl}/$id');
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
}
