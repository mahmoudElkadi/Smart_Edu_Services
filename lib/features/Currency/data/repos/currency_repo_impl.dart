import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/currency_model.dart';
import '../model/one_currency.dart';
import 'currency_repo.dart';

class CurrenciesRepoImpl implements CurrencyRepo {
  @override
  Future<CurrencyModel> allCurrencies() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.currencyUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var currencies = CurrencyModel.fromJson(jsonDecode(response.body));
      return currencies;
    } else {
      throw Exception("failed to get Currencies");
    }
  }

  @override
  Future<int> createCurrencies(String name, String price) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'name': name, 'price': price};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.currencyUrl);
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      return 2;
    } else {
      throw Exception("failed to get Currencies");
    }
  }

  @override
  Future<int> deleteCurrencies(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.currencyUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Currencies");
    }
  }

  //
  @override
  Future<int> updateCurrencies(
      String id, String name, String price, String expire) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'name': name,
      'price': price,
      'expired': expire
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.currencyUrl}/$id');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      return 2;
    } else {
      throw Exception("failed to update Currencies");
    }
  }

  @override
  Future<OneCurrencyModel> detailsCurrencies(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.currencyUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var currency = OneCurrencyModel.fromJson(jsonDecode(response.body));
      return currency;
    } else {
      throw Exception("failed to get Specialty");
    }
  }
}
