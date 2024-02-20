import '../model/currency_model.dart';
import '../model/one_currency.dart';

abstract class CurrencyRepo {
  Future<CurrencyModel> allCurrencies();
  Future<int> createCurrencies(String name, String price);
  Future<int> updateCurrencies(
      String id, String name, String price, String expire);
  Future<OneCurrencyModel> detailsCurrencies(String id);
  Future<int> deleteCurrencies(String id);
}
