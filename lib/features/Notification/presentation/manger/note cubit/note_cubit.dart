import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_mode.dart';
import '../../../data/repos/Note_repo.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.noteRepo) : super(NoteInitial());

  final NoteRepo noteRepo;

  static NoteCubit get(context) => BlocProvider.of(context);

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    emit(ObscureText());
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  late Future<NoteModel> allNote;

  getNote() {
    try {
      emit(NoteUserLoading());
      allNote = noteRepo.getNote();
      emit(NoteUserSuccess());
    } catch (error) {
      Center(
        child: Text(
          "Notification Not Found ",
        ),
      );
    }
  }
}
