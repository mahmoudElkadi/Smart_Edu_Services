import '../model/bank_model.dart';
import '../model/one_bank.dart';

abstract class BankRepo {
  Future<List<BankModel>> getAllBank();

  Future<OneBankModel> getOneBank(String id);

  Future<int> createBank(String title, String currency, int balance);

  Future<int> deleteBank(String id);
  Future<int> updateBank(
      String? id, String? title, String? currency, int? balance);
}
