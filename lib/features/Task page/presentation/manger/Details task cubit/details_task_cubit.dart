import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Task%20page/data/model/customer_model.dart';
import 'package:smart/features/Task%20page/data/model/details_task_model.dart';
import 'package:smart/features/Task%20page/presentation/manger/Details%20task%20cubit/details_task_state.dart';

import '../../../../Client/presentation/manger/client cubit/client_cubit.dart';
import '../../../../Country/presentation/manger/country cubit/Country_cubit.dart';
import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';
import '../../../../Statuses/presentation/manger/Status cubit/Status_cubit.dart';
import '../../../../freelancer/presentation/manger/Freelancer cubit/Freelancer_cubit.dart';
import '../../../data/repos/details_task_repo.dart';

class DetailsTaskCubit extends Cubit<TaskDetailsState> {
  DetailsTaskCubit(this.detailsTaskRepo) : super(TaskDetailsInitial());

  static DetailsTaskCubit get(context) => BlocProvider.of(context);

  DetailsTaskRepo detailsTaskRepo;

  TextEditingController currencyController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController channelController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController clientOfferController = TextEditingController();
  TextEditingController clientPriceController = TextEditingController();
  TextEditingController freelancerController = TextEditingController();
  TextEditingController suggestedOfferController = TextEditingController();
  TextEditingController freelancerPriceController = TextEditingController();
  TextEditingController profitController = TextEditingController();

  @override
  Future<void> close() async {
    currencyController.dispose();
    profitController.dispose();
    freelancerPriceController.dispose();
    suggestedOfferController.dispose();
    freelancerController.dispose();
    clientPriceController.dispose();
    clientOfferController.dispose();
    clientController.dispose();
    titleController.dispose();
    specialityController.dispose();
    descriptionController.dispose();
    userRoleController.dispose();
    userNameController.dispose();
    super.close();
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  late Future<DetailsTaskModel> myTasks;

  getTask(String id) {
    try {
      emit(GetTaskDetailsLoading());
      myTasks = detailsTaskRepo.detailsTasks(id);
      emit(GetTaskDetailsSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Tasks Details Error");
    }
  }

  late Future<CustomerModel> shareWith;
  getCustomer() {
    try {
      emit(ShareWithLoading());
      shareWith = detailsTaskRepo.customerService();
      emit(ShareWithSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Share With Error");
    }
  }

  updateTask({
    required String id,
    required String title,
    required String description,
    required String channel,
    required String client,
    required String freelancer,
    required String speciality,
    required String taskStatus,
    required String deadline,
    required String createdBy,
    required String acceptedBy,
    required String taskCurrency,
    required String paid,
    required String cost,
    required String profitAmount,
  }) {
    emit(UpdateUserLoading());
    isLoading = true;
    detailsTaskRepo
        .updateTask(
            id,
            title,
            description,
            channel,
            client,
            freelancer,
            speciality,
            taskStatus,
            deadline,
            createdBy,
            acceptedBy,
            taskCurrency,
            paid,
            cost,
            profitAmount)
        .then((response) {
      if (response == 0) {
        Get.snackbar(
            "Updated Freelancer", "Freelancer has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;

        emit(UpdateUserSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Freelancer Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(UpdateUserSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  addTask({
    required String title,
    required String description,
    required String channel,
    required String client,
    required String shareWith,
    required String speciality,
    required String status,
    required String deadline,
    required String taskCurrency,
    required String paid,
  }) {
    emit(AddUserLoading());
    isLoading = true;
    detailsTaskRepo
        .addTask(
      title,
      description,
      channel,
      client,
      shareWith,
      speciality,
      status,
      deadline,
      taskCurrency,
      paid,
    )
        .then((response) {
      if (response == 0) {
        Get.snackbar("Add Freelancer", "Freelancer has been Added successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;

        emit(AddUserSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Freelancer Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(UpdateUserSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
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

  void callFreelancerCubit(BuildContext context) async {
    final freelancerCubit = context.read<FreelancerCubit>();
    await freelancerCubit.getFreelancer();
    emit(UserSuccessFreelancer());

    // Call the function
  }

  void callClientCubit(BuildContext context) async {
    final clientCubit = context.read<ClientCubit>();
    await clientCubit.getClient();
    emit(UserSuccessClient());

    // Call the function
  }

  void callStatusCubit(BuildContext context) async {
    final clientCubit = context.read<StatusCubit>();
    await clientCubit.getStatus();
    emit(UserSuccessStatus());

    // Call the function
  }

  List<String> userRole = ["admin", "customerService", "specialistService"];
  List<String> channel = ["Telegram", "WhatsApp", "Website", "Other"];
}
