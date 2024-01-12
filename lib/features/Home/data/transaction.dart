import 'dart:math';

import 'package:flutter/material.dart';

class QuickDetails{
  String title;
  String description;
  String amount;
  IconData iconData;
  Color color;

  QuickDetails(this.title,this.amount,this.iconData,this.color,this.description);

}

List <QuickDetails> quickDetails(){
  return [
    QuickDetails("Salesman", '2',  Icons.person , Colors.purple[400]!,"Salesman"),
    QuickDetails("Completed Orders", '490', Icons.check , Colors.green[100]!,"Orders"),
    QuickDetails("Holded Orders", '120',  Icons.watch_later_outlined , Colors.green[100]!,"Orders"),
    QuickDetails("In Stock", '510',  Icons.error_outline , Colors.orange[100]!,"Items"),
    QuickDetails("Out Of Stock", '86',  Icons.cancel_outlined , Colors.red[100]!,"Items")
  ];
}

List <String> store=["Dream City 1","Dream City 2","Dream City 3"];