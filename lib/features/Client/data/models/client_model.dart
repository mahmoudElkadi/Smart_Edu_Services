class ClientModel {
  ClientModel({
    required this.clients,
  });

  final List<Client> clients;

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      clients: json["clients"] == null
          ? []
          : List<Client>.from(json["clients"]!.map((x) => Client.fromJson(x))),
    );
  }
}

class Client {
  Client({
    required this.id,
    required this.clientname,
    required this.ownerName,
    required this.phone,
    required this.website,
    required this.country,
    required this.tasksCount,
    required this.completedCount,
    required this.totalGain,
    required this.totalProfit,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? clientname;
  final String? ownerName;
  final String? phone;
  final String? website;
  final Country? country;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final Currency? currency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json["_id"],
      clientname: json["clientname"],
      ownerName: json["ownerName"],
      phone: json["phone"],
      website: json["website"],
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      currency:
          json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Country {
  Country({
    required this.id,
    required this.countryName,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? countryName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["_id"],
      countryName: json["countryName"],
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
