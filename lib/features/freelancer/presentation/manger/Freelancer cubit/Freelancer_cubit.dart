import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_cubit.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';
import '../../../data/model/freelancer_model.dart';
import '../../../data/model/one_freelancer_model.dart';
import '../../../data/repos/freelancer_repo.dart';
import 'Freelancer_state.dart';

class FreelancerCubit extends Cubit<FreelancerState> {
  FreelancerCubit(this.freelancerRepo) : super(FreelancerInitial());

  static FreelancerCubit get(context) => BlocProvider.of(context);

  FreelancerRepo freelancerRepo;

  TextEditingController subFreelancerController = TextEditingController();
  TextEditingController FreelancerController = TextEditingController();

  TextEditingController editSubFreelancerController = TextEditingController();
  TextEditingController editFreelancerController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Future<void> close() async {
    subFreelancerController.dispose();
    FreelancerController.dispose();
    editSubFreelancerController.dispose();
    editFreelancerController.dispose();

    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();

    super.close();
  }

  late Future<OneFreelancerModel> oneFreelancer;

  getOneFreelancer(String id) async {
    try {
      emit(GetOneFreelancerLoading());

      oneFreelancer = freelancerRepo.detailsFreelancer(id);
      emit(GetOneFreelancerSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Freelancer Details Error");
    }
  }

  late Future<FreelancerModel> allFreelancer;
  getFreelancer() async {
    try {
      emit(GetFreelancerLoading());

      allFreelancer = freelancerRepo.allFreelancer();
      freelancerModel = await freelancerRepo.allFreelancer();

      emit(GetFreelancerSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Freelancer Error");
    }
  }

  filterFreelancer({String? sort, String? speciality}) {
    try {
      emit(FilterFreelancerLoading());
      allFreelancer =
          freelancerRepo.filterFreelancer(sort: sort, speciality: speciality);
      emit(FilterFreelancerSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Freelancer Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createFreelancer({
    required String name,
    required String email,
    required String phone,
    required String country,
    required String currency,
    required String speciality,
    required String password,
  }) {
    emit(AddFreelancerLoading());
    isLoading = true;
    freelancerRepo
        .createFreelancer(
            name, email, phone, country, currency, speciality, password)
        .then((response) {
      if (response == 0) {
        subFreelancerController.clear();
        FreelancerController.clear();
        isLoading = false;
        Get.snackbar("Freelancer has been added successfully", "",
            padding: EdgeInsets.only(top: 30.h),
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getFreelancer();
      } else if (response == 1) {
        subFreelancerController.clear();
        FreelancerController.clear();
        isLoading = false;
        Get.snackbar(
          "Freelancer already exist!",
          "",
          padding: EdgeInsets.only(top: 30.h),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
        emit(AddFreelancerSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  changeState() {
    emit(ChangeState());
  }

  updateFreelancer({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String country,
    required String currency,
    required String speciality,
  }) {
    emit(AddFreelancerLoading());
    isLoading = true;
    freelancerRepo
        .updateFreelancer(id, name, email, phone, country, currency, speciality)
        .then((response) {
      if (response == 0) {
        Get.snackbar(
            "Updated Freelancer", "Freelancer has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;

        emit(AddFreelancerSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Freelancer Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddFreelancerSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  deleteFreelancer({
    required String id,
    required String sub,
  }) {
    emit(DeleteFreelancerLoading());
    isLoading = true;
    freelancerRepo.deleteFreelancer(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Freelancer", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getFreelancer();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Freelancer Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ));
        getFreelancer();
        emit(DeleteFreelancerSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    emit(ObscureText());
  }

  void callSpecialityCubit(BuildContext context) async {
    final specialityCubit = context.read<SpecialityCubit>();
    await specialityCubit.getSpeciality();
    emit(FreelancerSuccessSpeciality());
    // Call the function
  }

  void callCountryCubit(BuildContext context) async {
    final countryCubit = context.read<CountryCubit>();
    await countryCubit.getCountry();
    emit(FreelancerSuccessCountry());

    // Call the function
  }

  void callCCurrencyCubit(BuildContext context) async {
    final currencyCubit = context.read<CurrenciesCubit>();
    await currencyCubit.getCurrencies();
    emit(FreelancerSuccessCurrency());

    // Call the function
  }
}
