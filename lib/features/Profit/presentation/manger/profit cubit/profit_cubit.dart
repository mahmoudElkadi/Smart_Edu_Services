import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profit_state.dart';

class ProfitCubit extends Cubit<ProfitState>{
  ProfitCubit():super(ProfitInitial());



  static ProfitCubit get(context) => BlocProvider.of(context);



  TextEditingController profitMaxController=TextEditingController();
  TextEditingController profitMinController=TextEditingController();

  String _value='Dropdown 1';

  String get value => _value;

  set value(String newState){
    _value=newState;
    emit(ViewChange());
  }

  bool _viewText=true;

  bool get viewText => _viewText;

  set viewText(bool newState){
    _viewText=newState;
    emit(ViewChange());
  }







}