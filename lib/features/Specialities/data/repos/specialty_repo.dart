import 'package:smart/features/Specialities/data/models/one_specialty.dart';

import '../models/speciality_model.dart';

abstract class SpecialityRepo {
  Future<SpecialityModel> allSpeciality();
  Future<int> createSpecialty(String sub, String specialty);
  Future<int> updateSpecialty(String id, String sub, String specialty);
  Future<OneSpecialityModel> detailsSpecialty(String id);
  Future<int> deleteSpecialty(String id);
}
