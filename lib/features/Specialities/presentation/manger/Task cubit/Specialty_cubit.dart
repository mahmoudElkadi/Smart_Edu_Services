import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_state.dart';

import '../../../../../core/utils/constant.dart';
import '../../../data/models/one_specialty.dart';
import '../../../data/models/speciality_model.dart';
import '../../../data/repos/specialty_repo.dart';

class SpecialityCubit extends Cubit<SpecialityState> {
  SpecialityCubit(this.specialityRepo) : super(SpecialityInitial());

  static SpecialityCubit get(context) => BlocProvider.of(context);

  SpecialityRepo specialityRepo;

  TextEditingController subSpecialityController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  TextEditingController editSubSpecialityController = TextEditingController();
  TextEditingController editSpecialityController = TextEditingController();

  @override
  Future<void> close() async {
    subSpecialityController.dispose();
    specialityController.dispose();
    editSubSpecialityController.dispose();
    editSpecialityController.dispose();

    super.close();
  }

  late Future<OneSpecialityModel> oneSpeciality;

  getOneSpecialty(String id) {
    try {
      emit(GetOneSpecialtyLoading());
      oneSpeciality = specialityRepo.detailsSpecialty(id);
      emit(GetOneSpecialtySuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "speciality Details Error");
    }
  }

  late Future<SpecialityModel> mySpeciality;
  getSpeciality() async {
    try {
      emit(GetSpecialityLoading());
      mySpeciality = specialityRepo.allSpeciality();
      specialityModel = await specialityRepo.allSpeciality();

      emit(GetSpecialitySuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Speciality Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createSpecialist({
    required String sub,
    required String specialty,
  }) {
    emit(AddSpecialtyLoading());
    isLoading = true;
    specialityRepo.createSpecialty(sub, specialty).then((response) {
      if (response == 0) {
        subSpecialityController.clear();
        specialityController.clear();
        isLoading = false;
        Get.snackbar(
          "Add Speciality",
          "Speciality has been added successfully",
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.check),
        );

        emit(AddSpecialtySuccess());
      } else if (response == 1) {
        subSpecialityController.clear();
        specialityController.clear();
        isLoading = false;
        Get.snackbar("Speciality already exist!", "");
        emit(AddSpecialtySuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  updateSpecialist({
    required String id,
    required String sub,
    required String specialty,
  }) {
    emit(AddSpecialtyLoading());
    isLoading = true;
    specialityRepo.updateSpecialty(id, sub, specialty).then((response) {
      if (response == 0) {
        isLoading = false;
        Get.snackbar(
            "Updated Speciality", "Speciality has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        emit(AddSpecialtySuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Speciality Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddSpecialtySuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  deleteSpecialist({
    required String id,
    required String sub,
  }) {
    emit(DeleteSpecialtyLoading());
    isLoading = true;
    specialityRepo.deleteSpecialty(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Speciality", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.ac_unit));
        getSpeciality();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Speciality Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        getSpeciality();
        emit(DeleteSpecialtySuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }
}
