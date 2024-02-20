import 'dart:convert';

List<AccountModel> accountModelFromJson(String str) => List<AccountModel>.from(
    json.decode(str).map((x) => AccountModel.fromJson(x)));

class AccountModel {
  AccountModel({
    required this.id,
    required this.owner,
    this.title,
    required this.type,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? owner;
  final String? title;
  final String? type;
  final int? balance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json["_id"],
      owner: json["owner"],
      title: json["title"],
      type: json["type"],
      balance: json["balance"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
