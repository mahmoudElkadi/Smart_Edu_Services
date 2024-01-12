import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

List <List> status=[
  ["On Going","34",HexColor("#4791FF"),Icons.task],
  ["Delivered","34",HexColor("#4791FF"),Icons.task],
  ["Done","34",HexColor("#4791FF"),Icons.task],
  ["Working On","34",HexColor("#02BC77"),Icons.task],
  ["Approved","34",HexColor("#02BC77"),Icons.task],
  ["Edit","34",HexColor("#02BC77"),Icons.task],
  ["Offer Submit","34",HexColor("#FFD950"),Icons.task],
  ["Wait Offer","34",HexColor("#FFD950"),Icons.task],
  ["Not Available","34",HexColor("#FFD950"),Icons.task],
  ["Rejected","34",HexColor("#FF2366"),Icons.task],
  ["Cancel","34",HexColor("#FF2366"),Icons.task],
  ["On Going","34",HexColor("#FF2366"),Icons.task]
];
String? value;
String? value2;



class TopProductID{
  String id;
  String itemCount;
  String salesMan;
  String price;
  String profit;
  String commission;
  String date;

  TopProductID(this.id,this.itemCount,this.salesMan,this.price,this.profit,this.commission,this.date);
}

List<TopProductID> topProductID(){
  return [
    TopProductID("123456","جزئية في مادة التمويل","Khaled Mohamed","Khaled Mohamed","5500","21-5-2023","waiting offer"),
    TopProductID("123457","the impact of telemedicine","Mohamed Elsayed","Mohamed Elsayed","6000 ","22-5-2023","delivered"),
    TopProductID("123458","the impact of telemedicine","Yasser Ahmed","Mohamed Elsayed","6500 ","25-5-2023","on Gong"),
    TopProductID("1234560","جزئية في مادة التمويل","Ahmed Youssef","Ahmed Youssef","500 ","09-5-2023","delivered"),
    TopProductID("1234561","جزئية في مادة التمويل","Youssef Elmahy","Ahmed Youssef","5050 ","14-5-2023","Not Available"),
    TopProductID("1234561","جزئية في مادة التمويل","Youssef Elmahy","Ahmed Youssef","5050 ","14-5-2023","Not Available"),
    TopProductID("1234561","جزئية في مادة التمويل","Youssef Elmahy","Ahmed Youssef","5050 ","14-5-2023","Not Available"),
    TopProductID("1234561","جزئية في مادة التمويل","Youssef Elmahy","Ahmed Youssef","5050 ","14-5-2023","Not Available"),


  ];
}

List <String> store=["Dropdown 1","Dropdown 2","Dropdown 3"];
