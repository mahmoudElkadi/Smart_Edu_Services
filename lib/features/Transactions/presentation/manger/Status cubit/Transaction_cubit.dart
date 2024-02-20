import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../data/model/Transaction_model.dart';
import '../../../data/repos/transaction_repo.dart';
import 'Transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit(this.transactionRepo) : super(TransactionInitial());

  static TransactionCubit get(context) => BlocProvider.of(context);

  TransactionRepo transactionRepo;

  TextEditingController TransactionNameController = TextEditingController();
  TextEditingController roleSearchController = TextEditingController();

  List<String> Transaction = ["customerService", "specialistService", "admin"];
  // TextEditingController TransactionController = TextEditingController();
  //
  // TextEditingController editSubTransactionController = TextEditingController();
  // TextEditingController editTransactionController = TextEditingController();

  // @override
  // Future<void> close() async {
  //   subTransactionController.dispose();
  //   TransactionController.dispose();
  //   editSubTransactionController.dispose();
  //   editTransactionController.dispose();
  //
  //   super.close();
  // }

  // late Future<OneTransactionModel> oneTransaction;
  //
  // getOneTransaction(String id) {
  //   try {
  //     emit(GetOneTransactionLoading());
  //     oneTransaction = TransactionRepo.detailsTransaction(id);
  //     emit(GetOneTransactionSuccess());
  //   } catch (error) {
  //     Get.snackbar(error.toString(), "Transaction Details Error");
  //   }
  // }

  late Future<TransactionModel> myTransaction;
  getTransaction() {
    try {
      emit(GetTransactionLoading());
      myTransaction =
          transactionRepo.allTransaction() as Future<TransactionModel>;
      emit(GetTransactionSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Transaction Error");
    }
  }

  bool isLoading = false;

  void loading() {
    isLoading = true;
    emit(LoadingSuccess());
  }

  // createTransaction({
  //   required String name,
  //   required String role,
  // }) {
  //   emit(AddTransactionLoading());
  //   isLoading = true;
  //   TransactionRepo.createTransaction(name, role).then((response) {
  //     if (response == 0) {
  //       TransactionNameController.clear();
  //       roleSearchController.clear();
  //       isLoading = false;
  //       Get.snackbar("Add Transaction", "Transaction has been added successfully",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.blue,
  //           icon: const Icon(Icons.check));
  //       getTransaction();
  //     } else if (response == 1) {
  //       isLoading = false;
  //       Get.snackbar("Transaction already exist!", "",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.red,
  //           icon: const Icon(Icons.warning));
  //       emit(AddTransactionSuccess());
  //     } else {
  //       Get.snackbar("title", "not edit");
  //     }
  //   });
  // }

  //
  // updateSpecialist({
  //   required String id,
  //   required String name,
  //   required String role,
  // }) {
  //   emit(AddTransactionLoading());
  //   isLoading = true;
  //   TransactionRepo.updateTransaction(id, name, role).then((response) {
  //     if (response == 0) {
  //       isLoading = false;
  //       Get.snackbar("Updated Transaction", "Transaction has been update successfully",
  //           colorText: Colors.white, backgroundColor: Colors.blue);
  //       emit(AddTransactionSuccess());
  //     } else if (response == 1) {
  //       isLoading = false;
  //       Get.snackbar("Transaction Not exists!", "",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.red,
  //           icon: const Icon(Icons.warning_amber));
  //       emit(AddTransactionSuccess());
  //     } else {
  //       Get.snackbar("title", "not edit");
  //     }
  //   });
  // }

  //
  // deleteTransaction({
  //   required String id,
  //   required String name,
  // }) {
  //   emit(DeleteTransactionLoading());
  //   isLoading = true;
  //   TransactionRepo.deleteTransaction(id).then((response) {
  //     if (response == 0) {
  //       Get.snackbar("Delete Transaction", "$name has been deleted successfully",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.blue,
  //           icon: const Icon(Icons.ac_unit));
  //       getTransaction();
  //     } else if (response == 1) {
  //       isLoading = false;
  //       Get.snackbar("Transaction Not exists!", "",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.red,
  //           icon: const Icon(Icons.warning_amber));
  //       getTransaction();
  //       emit(DeleteTransactionSuccess());
  //     } else {
  //       Get.snackbar("title", "not edit");
  //     }
  //   });
  // }
}
