import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart/features/Notification/data/models/note_mode.dart';

import '../../../../core/utils/config.dart';
import '../../../../core/utils/constant.dart';
import 'Note_repo.dart';

class NoteRepoImpl implements NoteRepo {
  @override
  Future<NoteModel> getNote() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var uri = Uri(
        scheme: 'http',
        host: Config.localHost,
        port: Config.port,
        path: Config.noteUrl);
    http.Response response = await http.get(uri, headers: requestHeaders);
    print(uri);

    if (response.statusCode == 200) {
      var note = NoteModel.fromJson(jsonDecode(response.body));
      return note;
    } else if (response.statusCode == 500) {
      throw Exception("failed to get note");
    } else {
      throw Exception("failed to get note");
    }
  }
}
