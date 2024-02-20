import '../model/transaction_model.dart';

abstract class TransactionRepo {
  Future<TransactionModel> allTransaction();
  Future<int> createTransaction(String name, String role);
  Future<int> updateTransaction(String id, String name, String role);
  // Future<OneTransactionModel> detailsTransaction(String id);
  Future<int> deleteTransaction(String id);
}
