import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart/features/Profit/data/models/profit_model.dart';
import 'package:smart/features/Profit/data/repos/profit_repo.dart';

import 'profit_state.dart';

class ProfitCubit extends Cubit<ProfitState> {
  ProfitCubit(this.profitRepo) : super(ProfitInitial());

  static ProfitCubit get(context) => BlocProvider.of(context);

  ProfitRepo profitRepo;

  TextEditingController profitMaxController = TextEditingController();
  TextEditingController profitMinController = TextEditingController();

  String _value = 'Customer Profit';

  String get value => _value;

  set value(String newState) {
    _value = newState;
    emit(ViewChange());
  }

  bool _viewText = true;

  bool get viewText => _viewText;

  set viewText(bool newState) {
    _viewText = newState;
    emit(ViewChange());
  }

  late Future<ProfitModel> customerProfit;
  getCustomerProfit() {
    try {
      emit(GetCustomerProfitLoading());
      customerProfit = profitRepo.customerProfits();
      emit(GetCustomerProfitLoading());
    } catch (error) {
      Get.snackbar(error.toString(), "Profit Error");
    }
  }

  List<String> profitItem = ['Customer Profit', 'Specialist Profit'];

  late Future<ProfitModel> specialistProfit;
  getSpecialistProfit() {
    try {
      emit(GetSpecialistProfitLoading());
      specialistProfit = profitRepo.specialistProfits();
      emit(GetSpecialistProfitSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Profit Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  editAllProfit({
    required String type,
    required String id,
    required String max,
    required String min,
  }) {
    emit(EditProfitLoading());
    profitRepo
        .editProfits(type: type, id: id, max: max, min: min)
        .then((response) {
      if (response == true) {
        getCustomerProfit();
        getSpecialistProfit();
        profitMinController.clear();
        profitMaxController.clear();
        isLoading = false;
        _viewText = true;
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }
}
