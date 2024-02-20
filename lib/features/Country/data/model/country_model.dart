class CountryModel {
  CountryModel({
    required this.countries,
  });

  final List<Country> countries;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countries: json["countries"] == null
          ? []
          : List<Country>.from(
              json["countries"]!.map((x) => Country.fromJson(x))),
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
