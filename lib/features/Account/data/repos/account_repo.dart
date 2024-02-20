import '../models/account_model.dart';
import '../models/one_account_model.dart';

abstract class AccountRepo {
  Future<List<AccountModel>> allAccounts();
  Future<OneAccountModel> getOneAccounts(String id);
}
