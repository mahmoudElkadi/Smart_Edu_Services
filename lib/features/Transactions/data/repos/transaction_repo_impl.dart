import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Transactions/data/repos/transaction_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import '../model/transaction_model.dart';

class TransactionRepoImpl implements TransactionRepo {
  @override
  Future<TransactionModel> allTransaction() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.transactionUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var transaction = TransactionModel.fromJson(jsonDecode(response.body));
      return transaction;
    } else {
      throw Exception("failed to get Transaction");
    }
  }

  @override
  Future<int> createTransaction(String name, String role) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'name': name, 'role': role};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.transactionUrl);
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
      throw Exception("failed to get Transaction");
    }
  }

  @override
  Future<int> deleteTransaction(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.transactionUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);
    print(uri);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Transaction");
    }
  }

//  @override
  // Future<OneTransactionModel> detailsTransaction(String id) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   var uri = Uri(
  //       scheme: 'http',
  //       host: Config.localHost,
  //       port: Config.port,
  //       path: '${Config.transactionUrl}/$id');
  //   http.Response response = await http.get(
  //     uri,
  //     headers: requestHeaders,
  //   );
  //
  //   if (response.statusCode == 200) {
  //     var specialty = OneTransactionModel.fromJson(jsonDecode(response.body));
  //     return specialty;
  //   } else {
  //     throw Exception("failed to get Specialty");
  //   }
  // }

  //
  @override
  Future<int> updateTransaction(String id, String name, String role) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {'name': name, 'role': role};

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.transactionUrl}/$id');
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
      throw Exception("failed to update Transaction");
    }
  }
  //
  // // @override
  // // Future<OneTransactionModel> detailsSpecialty(String id) async {
  // //   Map<String, String> requestHeaders = {
  // //     'Content-Type': 'application/json',
  // //     'Authorization': 'Bearer $token'
  // //   };
  // //   var uri = Uri(
  // //       scheme: 'http',
  // //       host: Config.localHost,
  // //       port: Config.port,
  // //       path: '${Config.TransactionUrl}/$id');
  // //   http.Response response = await http.get(
  // //     uri,
  // //     headers: requestHeaders,
  // //   );
  // //
  // //   if (response.TransactionCode == 200) {
  // //     var specialty = OneTransactionModel.fromJson(jsonDecode(response.body));
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
  //       path: '${Config.TransactionUrl}/$id');
  //   http.Response response = await http.delete(uri, headers: requestHeaders);
  //   print(uri);
  //
  //   if (response.TransactionCode == 200) {
  //     return 0;
  //   } else if (response.TransactionCode == 400) {
  //     return 1;
  //   } else {
  //     throw Exception("failed to update Transaction");
  //   }
  // }
}
