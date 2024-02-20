import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart/features/Account/data/models/one_account_model.dart';

import '../../../data/models/account_model.dart';
import '../../../data/repos/account_repo.dart';
import 'Account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.accountRepo) : super(AccountInitial());

  static AccountCubit get(context) => BlocProvider.of(context);

  AccountRepo accountRepo;

  TextEditingController subAccountController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  @override
  Future<void> close() async {
    subAccountController.dispose();
    accountController.dispose();

    super.close();
  }

  late Future<List<AccountModel>> myAccounts;
  getAccount() {
    try {
      emit(GetAccountLoading());
      myAccounts = accountRepo.allAccounts();
      emit(GetAccountSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Accounts Error");
    }
  }

  late Future<OneAccountModel> oneAccounts;
  getOneAccount(String id) {
    try {
      emit(GetAccountLoading());
      oneAccounts = accountRepo.getOneAccounts(id);
      emit(GetAccountSuccess());
    } catch (error) {
      Get.snackbar(error.toString(), "Accounts Error");
    }
  }
}
