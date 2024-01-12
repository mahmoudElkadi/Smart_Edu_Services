
import '../model/login_request.dart';

abstract class LoginRepo
{
  Future<int> loginUser(LoginReqModel model);

}

