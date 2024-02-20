import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Statuses/data/repos/status_repo.dart';

import '../../../../../core/utils/constant.dart';
import '../../../data/model/one_status.dart';
import '../../../data/model/status_model.dart';
import 'Status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit(this.statusRepo) : super(StatusInitial());

  static StatusCubit get(context) => BlocProvider.of(context);

  StatusRepo statusRepo;

  TextEditingController statusNameController = TextEditingController();
  TextEditingController roleSearchController = TextEditingController();

  List<String> status = ["customerService", "specialistService", "admin"];
  // TextEditingController StatusController = TextEditingController();
  //
  // TextEditingController editSubStatusController = TextEditingController();
  // TextEditingController editStatusController = TextEditingController();

  // @override
  // Future<void> close() async {
  //   subStatusController.dispose();
  //   StatusController.dispose();
  //   editSubStatusController.dispose();
  //   editStatusController.dispose();
  //
  //   super.close();
  // }

  late Future<OneStatusModel> oneStatus;

  getOneStatus(String id) {
    try {
      emit(GetOneStatusLoading());
      oneStatus = statusRepo.detailsStatus(id);

      emit(GetOneStatusSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Status Details Error");
    }
  }

  late Future<StatusModel> myStatus;
  getStatus() async {
    try {
      emit(GetStatusLoading());
      myStatus = statusRepo.allStatus();
      statusModel = await statusRepo.allStatus();

      emit(GetStatusSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Status Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  createStatus({
    required String name,
    required String role,
  }) {
    emit(AddStatusLoading());
    isLoading = true;
    statusRepo.createStatus(name, role).then((response) {
      if (response == 0) {
        statusNameController.clear();
        roleSearchController.clear();
        isLoading = false;
        Get.snackbar("Add Status", "Status has been added successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.check));
        getStatus();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Status already exist!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning));
        emit(AddStatusSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  //
  updateSpecialist({
    required String id,
    required String name,
    required String role,
  }) {
    emit(AddStatusLoading());
    isLoading = true;
    statusRepo.updateStatus(id, name, role).then((response) {
      if (response == 0) {
        isLoading = false;
        Get.snackbar("Updated Status", "Status has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        emit(AddStatusSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Status Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(AddStatusSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  //
  deleteStatus({
    required String id,
    required String name,
  }) {
    emit(DeleteStatusLoading());
    isLoading = true;
    statusRepo.deleteStatus(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Status", "$name has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.ac_unit));
        getStatus();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Status Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        getStatus();
        emit(DeleteStatusSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }
}
