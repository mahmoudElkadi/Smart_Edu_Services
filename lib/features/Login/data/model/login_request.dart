
import 'dart:convert';

LoginReqModel loginReqModelFromJson(String str) => LoginReqModel.fromJson(json.decode(str));

String loginReqModelToJson(LoginReqModel data) => json.encode(data.toJson());

class LoginReqModel {
  final String userName;
  final String password;

  LoginReqModel({
    required this.userName,
    required this.password,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
    userName: json["userName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password,
  };
}
