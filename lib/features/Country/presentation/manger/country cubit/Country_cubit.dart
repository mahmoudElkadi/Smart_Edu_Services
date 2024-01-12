import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Country_state.dart';

class CountryCubit extends Cubit<CountryState>{
  CountryCubit():super(CountryInitial());



  static CountryCubit get(context) => BlocProvider.of(context);



  TextEditingController countryController=TextEditingController();



  bool _viewText=true;

  bool get viewText => _viewText;

  set viewText(bool newState){
    _viewText=newState;
    emit(ViewChange());
  }







}