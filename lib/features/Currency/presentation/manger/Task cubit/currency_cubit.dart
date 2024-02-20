import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_cubit.dart';

import '../../../../Country/presentation/manger/country cubit/Country_cubit.dart';
import '../../../data/model/currency_model.dart';
import '../../../data/model/one_currency.dart';
import '../../../data/repos/currency_repo.dart';
import 'currency_state.dart';

class CurrenciesCubit extends Cubit<CurrenciesState> {
  CurrenciesCubit(this.currencyRepo) : super(CurrenciesInitial());

  static CurrenciesCubit get(context) => BlocProvider.of(context);

  CurrencyRepo currencyRepo;

  TextEditingController currencyNameController = TextEditingController();
  TextEditingController currencyPriceController = TextEditingController();

  TextEditingController editNameCurrenciesController = TextEditingController();
  TextEditingController editPriceCurrenciesController = TextEditingController();

  TextEditingController expireCurrenciesController = TextEditingController();
  List<String> expire = ['true', 'false'];

  @override
  Future<void> close() async {
    currencyNameController.dispose();
    currencyPriceController.dispose();
    editNameCurrenciesController.dispose();
    editPriceCurrenciesController.dispose();

    super.close();
  }

  late Future<OneCurrencyModel> oneCurrencies;

  getOneCurrencies(String id) {
    try {
      emit(GetOneCurrenciesLoading());
      oneCurrencies = currencyRepo.detailsCurrencies(id);

      emit(GetOneCurrenciesSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Currencies Details Error");
    }
  }

  void callSpecialityCubit(BuildContext context) async {
    final specialityCubit = context.read<SpecialityCubit>();
    await specialityCubit.getSpeciality();
    final countryCubit = context.read<CountryCubit>();
    await countryCubit.getCountry();
    final currencyCubit = context.read<CurrenciesCubit>();
    await currencyCubit.getCurrencies();
    // Call the function
  }

  void callCountryCubit(BuildContext context) async {
    final countryCubit = context.read<CountryCubit>();
    await countryCubit.getCountry();

    // Call the function
  }

  late Future<CurrencyModel> myCurrencies;
  // Assign a default model
  getCurrencies() async {
    try {
      emit(GetCurrenciesLoading());
      myCurrencies = currencyRepo.allCurrencies();
      currencyModel = await currencyRepo.allCurrencies();
      emit(GetCurrenciesSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Currencies Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createCurrency({required String name, required String price, context}) {
    emit(AddCurrenciesLoading());
    isLoading = true;
    currencyRepo.createCurrencies(name, price).then((response) {
      if (response == 0) {
        currencyNameController.clear();
        currencyPriceController.clear();
        isLoading = false;
        Get.snackbar("Add Currency", "Currencies has been added successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.check));
        getCurrencies();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Currencies already exist!", "");
        emit(AddCurrenciesSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  //
  updateCurrency({
    required String id,
    required String name,
    required String price,
    required String expire,
  }) {
    emit(AddCurrenciesLoading());
    isLoading = true;
    currencyRepo.updateCurrencies(id, name, price, expire).then((response) {
      if (response == 0) {
        isLoading = false;
        Get.snackbar(
            "Updated Currencies", "Currencies has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        emit(AddCurrenciesSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Currencies Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddCurrenciesSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  //
  deleteCurrency({required String id, required String sub, context}) {
    emit(DeleteCurrenciesLoading());
    isLoading = true;
    currencyRepo.deleteCurrencies(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Currencies", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.ac_unit));
        getCurrencies();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Currencies Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        getCurrencies();
        emit(DeleteCurrenciesSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }
}
