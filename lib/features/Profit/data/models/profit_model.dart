// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

List<ProfitModel> profitModelFromJson(String str) => List<ProfitModel>.from(
    json.decode(str).map((x) => ProfitModel.fromJson(x)));

class ProfitModel {
  ProfitModel({
    required this.profitSystem,
  });

  final ProfitSystem? profitSystem;

  factory ProfitModel.fromJson(Map<String, dynamic> json) {
    return ProfitModel(
      profitSystem: json["profitSystem"] == null
          ? null
          : ProfitSystem.fromJson(json["profitSystem"]),
    );
  }
}

class ProfitSystem {
  ProfitSystem({
    required this.id,
    required this.minimum,
    required this.maximum,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final int? minimum;
  final int? maximum;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory ProfitSystem.fromJson(Map<String, dynamic> json) {
    return ProfitSystem(
      id: json["_id"],
      minimum: json["minimum"],
      maximum: json["maximum"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
