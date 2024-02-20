import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/core/utils/constant.dart';
import 'package:smart/features/Users/presentation/manger/user%20cubit/user_state.dart';

import '../../../../Country/presentation/manger/country cubit/Country_cubit.dart';
import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';
import '../../../data/models/one_user_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/User_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  UserRepo userRepo;

  TextEditingController subUserController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController editSubUserController = TextEditingController();
  TextEditingController editUserController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController typeRoleController = TextEditingController();

  @override
  Future<void> close() async {
    subUserController.dispose();
    userController.dispose();
    editSubUserController.dispose();
    editUserController.dispose();
    fullNameController.dispose();

    emailController.dispose();
    userNameController.dispose();
    phoneController.dispose();

    super.close();
  }

  late Future<OneUserModel> oneUser;

  getOneUser(String id) {
    try {
      emit(GetOneUserLoading());
      oneUser = userRepo.detailsUser(id);
      emit(GetOneUserSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "User Details Error");
    }
  }

  late Future<UserModel> allUser;
  getUser() async {
    try {
      emit(GetUserLoading());
      allUser = userRepo.allUser();
      userModel = await userRepo.allUser();
      emit(GetUserSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "User Error");
    }
  }

  filterUser({String? sort, String? role}) {
    try {
      emit(FilterUserLoading());
      allUser = userRepo.filterUser(sort: sort, role: role);
      emit(FilterUserSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "User Error");
    }
  }

  //
  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createUser({
    required String fullName,
    required String userName,
    required String password,
    required String phone,
    required String userType,
    required String country,
    required String userRole,
  }) {
    emit(AddUserLoading());
    isLoading = true;
    userRepo
        .createUser(
            fullName, userName, password, phone, userType, country, userRole)
        .then((response) {
      if (response == 0) {
        subUserController.clear();
        userController.clear();
        isLoading = false;
        Get.snackbar("User has been added successfully", "",
            padding: EdgeInsets.only(top: 30.h),
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getUser();
      } else if (response == 1) {
        subUserController.clear();
        userController.clear();
        isLoading = false;
        Get.snackbar(
          "User already exist!",
          "",
          padding: EdgeInsets.only(top: 30.h),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
        emit(AddUserSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  changeState() {
    emit(ChangeState());
  }

  updateUser({
    required String id,
    required String fullName,
    required String userName,
    required String userRole,
    required String userType,
    required String country,
    required String phone,
    String? speciality,
  }) {
    emit(AddUserLoading());
    isLoading = true;
    userRepo
        .updateUser(id, fullName, userName, userRole, userType, country, phone,
            speciality ?? "")
        .then((response) {
      if (response == 0) {
        Get.snackbar("Updated User", "User has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;
        emit(AddUserSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("User Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddUserSuccess());
      }
    }).catchError((error) {
      isLoading = false;

      Get.snackbar(error.toString(), 'message');
    });
  }

  updateInfo({
    required String id,
    required String fullName,
    required String userName,
    required String userRole,
    required String country,
    required String phone,
  }) {
    emit(AddUserLoading());
    isLoading = true;
    userRepo
        .updateInfo(id, fullName, userName, userRole, country, phone)
        .then((response) {
      if (response == 0) {
        Get.snackbar("Updated User", "User has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;
        emit(AddUserSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("User Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddUserSuccess());
      }
    }).catchError((error) {
      isLoading = false;

      Get.snackbar(error.toString(), 'message');
    });
  }

  deleteUser({
    required String id,
    required String sub,
  }) {
    emit(DeleteUserLoading());
    isLoading = true;
    userRepo.deleteUser(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete User", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getUser();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("User Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ));
        getUser();
        emit(DeleteUserSuccess());
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
    emit(UserSuccessSpeciality());
    // Call the function
  }

  void callCountryCubit(BuildContext context) async {
    final countryCubit = context.read<CountryCubit>();
    await countryCubit.getCountry();
    emit(UserSuccessCountry());

    // Call the function
  }

  void callCCurrencyCubit(BuildContext context) async {
    final currencyCubit = context.read<CurrenciesCubit>();
    await currencyCubit.getCurrencies();
    emit(UserSuccessCurrency());

    // Call the function
  }

  List<String> userRole = ["admin", "customerService", "specialistService"];
}
