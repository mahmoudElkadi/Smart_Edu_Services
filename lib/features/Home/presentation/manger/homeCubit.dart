import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Home/presentation/manger/octagatorState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
}
