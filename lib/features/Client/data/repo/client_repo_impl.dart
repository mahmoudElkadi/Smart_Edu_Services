import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Client/data/models/client_model.dart';
import 'package:smart/features/Client/data/models/one_client_model.dart';
import 'package:smart/features/Client/data/repo/client_repo.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';

class ClientRepoImpl implements ClientRepo {
  @override
  Future<ClientModel> allClient() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.clientUrl);
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );
    print(uri);

    if (response.statusCode == 200) {
      var Client = ClientModel.fromJson(jsonDecode(response.body));
      return Client;
    } else {
      throw Exception("failed to get Client");
    }
  }

  @override
  Future<int> createClient(
    String clientName,
    String owner,
    String phone,
    String website,
    String country,
    String currency,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'clientName': clientName,
      'owner': owner,
      'phone': phone,
      'website': website,
      'country': country,
      'currency': currency,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.clientUrl);
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 500) {
      return 2;
    } else {
      throw Exception("failed to get Client");
    }
  }

  @override
  Future<int> deleteClient(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.clientUrl}/$id');
    http.Response response = await http.delete(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      return 0;
    } else if (response.statusCode == 400) {
      return 1;
    } else {
      throw Exception("failed to update Client");
    }
  }

  //
  @override
  Future<int> updateClient(
    String id,
    String clientName,
    String owner,
    String phone,
    String website,
    String country,
    String currency,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'clientName': clientName,
      'owner': owner,
      'phone': phone,
      'website': website,
      'country': country,
      'currency': currency,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.clientUrl}/$id');
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
      throw Exception("failed to update Client");
    }
  }

  //
  @override
  Future<OneClientModel> detailsClient(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.clientUrl}/$id');
    http.Response response = await http.get(
      uri,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var specialty = OneClientModel.fromJson(jsonDecode(response.body));
      return specialty;
    } else {
      throw Exception("failed to get Specialty");
    }
  }

  @override
  Future<ClientModel> filterClient({String? sort, String? country}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> data = {
      'sort': sort,
      'country': country,
    };

    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: '${Config.clientUrl}/sort/filter');
    http.Response response =
        await http.post(uri, headers: requestHeaders, body: jsonEncode(data));

    if (response.statusCode == 200) {
      var specialty = ClientModel.fromJson(jsonDecode(response.body));
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
//       path: '${Config.ClientUrl}/$id');
//   http.Response response = await http.delete(uri, headers: requestHeaders);
//   print(uri);
//
//   if (response.ClientCode == 200) {
//     return 0;
//   } else if (response.ClientCode == 400) {
//     return 1;
//   } else {
//     throw Exception("failed to update Client");
//   }
// }
}
