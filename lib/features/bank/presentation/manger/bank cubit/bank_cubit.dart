import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart/features/bank/data/model/one_bank.dart';

import '../../../../Currency/presentation/manger/Task cubit/currency_cubit.dart';
import '../../../../Main/presentation/views/main_view.dart';
import '../../../data/model/bank_model.dart';
import '../../../data/repos/bank_repo.dart';
import 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit(this.bankRepo) : super(BankInitial());

  static BankCubit get(context) => BlocProvider.of(context);

  BankRepo bankRepo;

  bool _viewText = true;
  TextEditingController accountTitle = TextEditingController();
  TextEditingController accountOwner = TextEditingController();
  TextEditingController accountBalance = TextEditingController();
  TextEditingController accountCurrency = TextEditingController();

  void Close() {
    accountTitle.dispose();
    accountOwner.dispose();
    accountBalance.dispose();
    accountCurrency.dispose();
  }

  var selectedCurrency;

  late String currencyValue;

  String? template;
  int? selectedIndex;
  changeState() {
    emit(ViewChange());
  }

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

  late Future<List<BankModel>> allBank;
  getBank() {
    try {
      emit(GetAllBankLoading());
      allBank = bankRepo.getAllBank();
      emit(GetAllBankSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Bank Error");
    }
  }

  late Future<OneBankModel> oneBank;

  getOneFreelancer(String id) async {
    try {
      emit(GetOneBankLoading());

      oneBank = bankRepo.getOneBank(id);
      emit(GetOneBankSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Bank Details Error");
    }
  }

  createBank({
    required String title,
    required String currency,
    required int balance,
  }) {
    emit(AddBankLoading());
    isLoading = true;
    bankRepo.createBank(title, currency, balance).then((response) {
      if (response == 0) {
        isLoading = false;
        Get.snackbar("Bank has been added successfully", "",
            padding: EdgeInsets.only(top: 30.h),
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        Get.offAll(() => const MainView(
              x: 4,
            ));
        getBank();
      } else if (response == 1) {
        accountTitle.clear();
        accountBalance.clear();
        accountCurrency.clear();
        isLoading = false;
        Get.snackbar(
          "Bank already exist!",
          "",
          padding: EdgeInsets.only(top: 30.h),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
        emit(AddBankSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  deleteBank({
    required String id,
    required String sub,
  }) {
    emit(DeleteBankLoading());
    isLoading = true;
    bankRepo.deleteBank(id).then((response) {
      if (response == 0) {
        Get.snackbar("Delete Bank", "$sub has been deleted successfully",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        getBank();
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Bank Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ));
        getBank();
        emit(DeleteBankSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  updateBank({
    String? id,
    String? title,
    String? currency,
    int? balance,
  }) {
    emit(UpdateBankLoading());
    isLoading = true;
    bankRepo.updateBank(id!, title, currency, balance).then((response) {
      if (response == 0) {
        Get.snackbar("Updated Bank", "Bank has been update successfully",
            colorText: Colors.white, backgroundColor: Colors.blue);
        isLoading = false;

        emit(UpdateBankSuccess());
      } else if (response == 1) {
        isLoading = false;
        Get.snackbar("Freelancer Not exists!", "",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning_amber));
        emit(UpdateBankSuccess());
      } else {
        Get.snackbar("title", "not edit");
      }
    });
  }

  void callCCurrencyCubit(BuildContext context) async {
    final currencyCubit = context.read<CurrenciesCubit>();
    await currencyCubit.getCurrencies();
    emit(UserSuccessCurrency());

    // Call the function
  }
}
