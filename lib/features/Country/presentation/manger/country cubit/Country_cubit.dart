import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/features/Country/data/model/country_model.dart';
import 'package:smart/features/Country/data/repos/country_repo.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(this.countryRepo) : super(CountryInitial());

  static CountryCubit get(context) => BlocProvider.of(context);

  CountryRepo countryRepo;

  TextEditingController countryController = TextEditingController();

  bool _viewText = true;

  bool get viewText => _viewText;

  set viewText(bool newState) {
    _viewText = newState;
    emit(ViewChange());
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  late Future<CountryModel> allCountry;
  getCountry() async {
    try {
      emit(GetAllCountryLoading());
      allCountry = countryRepo.getAllCountry();
      countryModel = await countryRepo.getAllCountry();
      emit(GetAllCountrySuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "country Error");
    }
  }

  deleteCountry({
    required String id,
    required String country,
  }) {
    emit(DeleteCountryLoading());
    countryRepo.deleteCountry(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Country", "$country has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.ac_unit));
        getCountry();
      } else if (response == 1) {
        Get.snackbar("country Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(DeleteCountrySuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  createCountry({
    required String country,
  }) {
    emit(AddCountryLoading());
    isLoading = true;
    countryRepo.createCountry(country).then((response) {
      if (response == 0) {
        Get.snackbar("Add Country", "Country has been added successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.check));

        getCountry();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Country already exist!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ));
        emit(AddCountrySuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }
}
