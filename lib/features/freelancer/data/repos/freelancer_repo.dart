import '../model/freelancer_model.dart';
import '../model/one_freelancer_model.dart';

abstract class FreelancerRepo {
  Future<FreelancerModel> allFreelancer();
  Future<int> createFreelancer(String name, String email, String phone,
      String country, String currency, String speciality, String password);
  Future<int> updateFreelancer(String id, String name, String email,
      String phone, String country, String currency, String speciality);
  Future<OneFreelancerModel> detailsFreelancer(String id);
  Future<int> deleteFreelancer(String id);
  Future<FreelancerModel> filterFreelancer({String? sort, String? speciality});
}
