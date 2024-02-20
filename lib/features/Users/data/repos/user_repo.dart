import '../models/one_user_model.dart';
import '../models/user_model.dart';

abstract class UserRepo {
  Future<UserModel> allUser();
  Future<int> createUser(String fullName, String userName, String password,
      String phone, String userType, String country, String userRole);
  Future<int> updateUser(
    String id,
    String fullName,
    String userName,
    String userRole,
    String userType,
    String country,
    String phone,
    String? speciality,
  );

  Future<int> updateInfo(
    String id,
    String fullName,
    String userName,
    String userRole,
    String country,
    String phone,
  );
  Future<OneUserModel> detailsUser(String id);
  Future<int> deleteUser(String id);
  Future<UserModel> filterUser({String? sort, String? role});
}
