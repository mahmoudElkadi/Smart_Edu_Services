import '../models/profit_model.dart';

abstract class ProfitRepo {
  Future<ProfitModel> customerProfits();
  Future<ProfitModel> specialistProfits();
  Future<bool> editProfits({
    required String type,
    required String id,
    required String max,
    required String min,
  });
}
