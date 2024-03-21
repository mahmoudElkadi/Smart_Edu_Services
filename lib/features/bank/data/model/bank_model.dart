import 'dart:convert';

List<BankModel> bankModelFromJson(String str) =>
    List<BankModel>.from(json.decode(str).map((x) => BankModel.fromJson(x)));

class BankModel {
  BankModel({
    required this.id,
    required this.title,
    required this.currency,
    required this.balance,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? title;
  final Currency? currency;
  final int? balance;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json["_id"],
      title: json["title"],
      currency:
          json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      balance: json["balance"],
      active: json["active"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Currency {
  Currency({
    required this.id,
    required this.currencyname,
    required this.priceToEgp,
    required this.expired,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? currencyname;
  final int? priceToEgp;
  final bool? expired;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json["_id"],
      currencyname: json["currencyname"],
      priceToEgp: json["priceToEGP"],
      expired: json["expired"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
