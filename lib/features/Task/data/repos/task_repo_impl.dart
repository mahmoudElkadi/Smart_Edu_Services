import 'dart:convert';
import 'package:get/get.dart';

import '../../../../core/Network/shared.dart';
import '../../../../core/utils/config.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';
import 'login_repo.dart';
import 'package:http/http.dart'as http;

 class LoginRepoImpl implements LoginRepo{


  @override
   Future<int> loginUser(LoginReqModel model) async{
    Map <String,String> requestHeaders ={'Content-Type':'application/json'};
    var uri = Uri(scheme:'http', host: Config.localHost, port: 5000, path: '/api/login');
   http.Response response =await http.post(
     uri,
     headers: requestHeaders,
     body: jsonEncode(model)
   );


    if(response.statusCode==200) {
      String userId = LoginResponseModel.fromJson(jsonDecode(response.body)).user.id;
      String token = LoginResponseModel.fromJson(jsonDecode(response.body)).token;

      await CacheHelper.saveString(key: "userId", value: userId);
      await CacheHelper.saveString(key: "token", value: token);
      return 0;
    }else if(response.statusCode==400){
      String error= jsonDecode(response.body)['err'];
      if (error=="User doesn't exist on system!"){
        return 1;
      }else if(error=="Password is incorrect"){
          return 2;
      }
      return 4;
    }
    else{
      return 3;
    }
}



  }












