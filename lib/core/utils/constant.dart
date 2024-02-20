import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart/features/Client/data/models/client_model.dart';
import 'package:smart/features/Specialities/data/models/speciality_model.dart';
import 'package:smart/features/Statuses/data/model/status_model.dart';

import '../../features/Country/data/model/country_model.dart';
import '../../features/Currency/data/model/currency_model.dart';
import '../../features/Users/data/models/user_model.dart';
import '../../features/freelancer/data/model/freelancer_model.dart';

List<List> status = [
  ["On Going", "34", HexColor("#4791FF"), Icons.task],
  ["Delivered", "34", HexColor("#4791FF"), Icons.task],
  ["Done", "34", HexColor("#4791FF"), Icons.task],
  ["Working On", "34", HexColor("#02BC77"), Icons.task],
  ["Approved", "34", HexColor("#02BC77"), Icons.task],
  ["Edit", "34", HexColor("#02BC77"), Icons.task],
  ["Offer Submit", "34", HexColor("#FFD950"), Icons.task],
  ["Wait Offer", "34", HexColor("#FFD950"), Icons.task],
  ["Not Available", "34", HexColor("#FFD950"), Icons.task],
  ["Rejected", "34", HexColor("#FF2366"), Icons.task],
  ["Cancel", "34", HexColor("#FF2366"), Icons.task],
  ["On Going", "34", HexColor("#FF2366"), Icons.task]
];
String? value;
String? value2;

String? userId;

String? token;
String? userRole;

class TopProductID {
  String id;
  String itemCount;
  String salesMan;
  String price;
  String profit;
  String commission;
  String date;

  TopProductID(this.id, this.itemCount, this.salesMan, this.price, this.profit,
      this.commission, this.date);
}

String? customerProfitId;
String? specialistProfitId;

SpecialityModel? specialityModel;
CurrencyModel? currencyModel;
CountryModel? countryModel;
FreelancerModel? freelancerModel;
ClientModel? clientModel;
StatusModel? statusModel;
UserModel? userModel;

List<TopProductID> topProductID() {
  return [
    TopProductID("123456", "جزئية في مادة التمويل", "Khaled Mohamed",
        "Khaled Mohamed", "5500", "21-5-2023", "waiting offer"),
    TopProductID("123457", "the impact of telemedicine", "Mohamed Elsayed",
        "Mohamed Elsayed", "6000 ", "22-5-2023", "delivered"),
    TopProductID("123458", "the impact of telemedicine", "Yasser Ahmed",
        "Mohamed Elsayed", "6500 ", "25-5-2023", "on Gong"),
    TopProductID("1234560", "جزئية في مادة التمويل", "Ahmed Youssef",
        "Ahmed Youssef", "500 ", "09-5-2023", "delivered"),
    TopProductID("1234561", "جزئية في مادة التمويل", "Youssef Elmahy",
        "Ahmed Youssef", "5050 ", "14-5-2023", "Not Available"),
    TopProductID("1234561", "جزئية في مادة التمويل", "Youssef Elmahy",
        "Ahmed Youssef", "5050 ", "14-5-2023", "Not Available"),
    TopProductID("1234561", "جزئية في مادة التمويل", "Youssef Elmahy",
        "Ahmed Youssef", "5050 ", "14-5-2023", "Not Available"),
    TopProductID("1234561", "جزئية في مادة التمويل", "Youssef Elmahy",
        "Ahmed Youssef", "5050 ", "14-5-2023", "Not Available"),
  ];
}

class MyObject {
  String name;
  String id;

  MyObject(this.name, this.id);
}

List<MyObject> specialityList = [];
List<String> store = ["Dropdown 1", "Dropdown 2", "Dropdown 3"];
List freelancerSort = ["completed", "profit"];

String status1 = '';
String speciality = '';
String country = '';
String start = '';
String end = '';
String freelancer = '';
String client = '';
String user = '';
String sort = '';
