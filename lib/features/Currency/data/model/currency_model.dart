class CurrencyModel {
  CurrencyModel({
    required this.currencies,
  });

  final List<Currency> currencies;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      currencies: json["currencies"] == null
          ? []
          : List<Currency>.from(
              json["currencies"]!.map((x) => Currency.fromJson(x))),
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
