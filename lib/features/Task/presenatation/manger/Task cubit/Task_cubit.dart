import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);

  bool _viewText = true;

  bool get viewText => _viewText;

  set viewText(bool newState) {
    _viewText = newState;
    emit(ViewChange());
  }
}
