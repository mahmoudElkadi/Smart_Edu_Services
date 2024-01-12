
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  final String message;
  final String token;
  final User user;

  LoginResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final String id;
  final String? fullname;
  final String? username;
  final String? password;
  final String? userRole;
  final String? userType;
  final String? country;
  final String? phone;
  final String? speciality;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? deviceToken;

  User({
     required this.id,
     this.fullname,
     this.username,
     this.password,
     this.userRole,
     this.userType,
     this.country,
     this.phone,
     this.speciality,
     this.tasksCount,
     this.completedCount,
     this.totalGain,
     this.totalProfit,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.deviceToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    fullname: json["fullname"],
    username: json["username"],
    password: json["password"],
    userRole: json["user_role"],
    userType: json["user_type"],
    country: json["country"],
    phone: json["phone"],
    speciality: json["speciality"],
    tasksCount: json["tasksCount"],
    completedCount: json["completedCount"],
    totalGain: json["totalGain"],
    totalProfit: json["totalProfit"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    deviceToken: json["deviceToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullname": fullname,
    "username": username,
    "password": password,
    "user_role": userRole,
    "user_type": userType,
    "country": country,
    "phone": phone,
    "speciality": speciality,
    "tasksCount": tasksCount,
    "completedCount": completedCount,
    "totalGain": totalGain,
    "totalProfit": totalProfit,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "deviceToken": deviceToken,
  };
}
