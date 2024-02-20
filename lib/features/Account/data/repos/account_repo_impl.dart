import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Account/data/models/one_account_model.dart';
import 'package:smart/features/Account/data/repos/account_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../models/account_model.dart';

class AccountRepoImpl implements AccountRepo {
  @override
  Future<List<AccountModel>> allAccounts() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: 5050,
        path: Config.accountUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var accounts = accountModelFromJson(response.body);
      return accounts;
    } else {
      throw Exception("failed to get Account");
    }
  }

  @override
  Future<OneAccountModel> getOneAccounts(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: 5050,
        path: "${Config.accountUrl}/$id");
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var accounts = OneAccountModel.fromJson(jsonDecode(response.body));
      return accounts;
    } else {
      throw Exception("failed to get Account");
    }
  }
}
