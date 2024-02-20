import 'package:smart/features/Notification/data/models/note_mode.dart';

abstract class NoteRepo {
  Future<NoteModel> getNote();
}
