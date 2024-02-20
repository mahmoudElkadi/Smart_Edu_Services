class OneCurrencyModel {
  OneCurrencyModel({
    required this.message,
  });

  final Message? message;

  factory OneCurrencyModel.fromJson(Map<String, dynamic> json) {
    return OneCurrencyModel(
      message:
          json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }
}

class Message {
  Message({
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

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
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
