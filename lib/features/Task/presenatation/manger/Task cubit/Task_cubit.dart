import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Task/data/model/task_res_model.dart';
import 'package:smart/features/Task/data/repos/task_repo.dart';
import 'package:smart/features/Task/presenatation/manger/Task%20cubit/task_state.dart';

import '../../../../Client/presentation/manger/client cubit/client_cubit.dart';
import '../../../../Country/presentation/manger/country cubit/Country_cubit.dart';
import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Specialities/presentation/manger/Task cubit/Specialty_cubit.dart';
import '../../../../Statuses/presentation/manger/Status cubit/Status_cubit.dart';
import '../../../../Users/presentation/manger/user cubit/user_cubit.dart';
import '../../../../freelancer/presentation/manger/Freelancer cubit/Freelancer_cubit.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);

  TaskRepo taskRepo;
  int limit = 3;

  TaskRepo get repository => taskRepo; // Getter for easier access

  ScrollController scrollController = ScrollController();
  bool isLoadMore = false;
  int page = 1;
  int totalProfit = 0;
  int totalGain = 0;
  int totalCost = 0;
  double totalProfitPercentage = 0;
  List<Task> tasks = [];
  TaskModel? response;

  Future<void> getTasks() async {
    try {
      emit(TasksLoading()); // Use TasksLoading for consistency

      response = await repository.myTasks(page);
      final newTasks = response?.tasks;

      tasks = tasks..addAll(newTasks!); // Efficiently append new tasks
      isLoadMore = false;
      totalProfit = totalProfit + response!.totalProfit!.toInt();
      totalGain = totalGain + response!.totalGain!.toInt();
      totalCost = totalCost + response!.totalCost!.toInt();
      totalProfitPercentage = ((totalProfit / totalGain) * 100);
      emit(TasksLoaded(
          tasks, isLoadMore)); // Emit state with tasks and loading flag
    } catch (error) {
      emit(
          TasksError(error.toString())); // Handle errors with a dedicated state
    }
  }

  void pagination() {
    scrollController.addListener(loadMore);
  }

  Future<void> loadMore() async {
    if (isLoadMore) return; // Exit if already loading

    try {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        isLoadMore = true;
        emit(TasksLoadingMore());

        final response = await repository.myTasks(page);
        final newTasks = response.tasks;

        tasks.addAll(newTasks);
        totalProfit = totalProfit + response.totalProfit!.toInt();
        totalGain = totalGain + response.totalGain!.toInt();
        totalCost = totalCost + response.totalCost!.toInt();
        totalProfitPercentage = ((totalProfit / totalGain) * 100);
        isLoadMore = false;
        page++;

        emit(TasksLoaded(tasks, isLoadMore));
      }
    } catch (error) {
      emit(TasksError(error.toString()));
    }
  }

  bool _viewText = true;

  bool get viewText => _viewText;

  set viewText(bool newState) {
    _viewText = newState;
    emit(ViewChange());
  }

  late Future<TaskModel> myTasks;
  late TaskModel myTasks2;

  getTask() async {
    try {
      emit(GetTaskLoading());
      myTasks = taskRepo.myTasks(page);

      emit(GetTaskSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Tasks Error");
    }
  }

  filterTask(
      String? status,
      String? speciality,
      String? country,
      String? start,
      String? end,
      String? freelancer,
      String? client,
      String? user,
      String? sort) async {
    try {
      emit(FilterTaskLoading());
      response = await repository.filterTasks(status, speciality, country,
          start, end, freelancer, client, user, sort);
      final newTasks = response?.tasks;
      tasks = [];
      tasks = tasks..addAll(newTasks!);

      emit(FilterTaskSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Tasks Error");
    }
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

  void callUserCubit(BuildContext context) async {
    final clientCubit = context.read<UserCubit>();
    await clientCubit.getUser();
    emit(UserSuccess());

    // Call the function
  }
}
