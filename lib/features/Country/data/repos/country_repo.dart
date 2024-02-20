import '../model/country_model.dart';

abstract class CountryRepo {
  Future<CountryModel> getAllCountry();
  Future<int> createCountry(String countryName);
  Future<int> deleteCountry(String id);
}
