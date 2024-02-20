class FreelancerModel {
  FreelancerModel({
    required this.freelancers,
  });

  final List<Freelancer> freelancers;

  factory FreelancerModel.fromJson(Map<String, dynamic> json) {
    return FreelancerModel(
      freelancers: json["freelancers"] == null
          ? []
          : List<Freelancer>.from(
              json["freelancers"]!.map((x) => Freelancer.fromJson(x))),
    );
  }
}

class Freelancer {
  Freelancer({
    required this.userRole,
    required this.id,
    required this.freelancername,
    required this.phone,
    required this.speciality,
    required this.email,
    required this.country,
    required this.tasksCount,
    required this.completedCount,
    required this.totalGain,
    required this.totalProfit,
    required this.currency,
    required this.v,
    required this.password,
    required this.deviceToken,
  });

  final String? userRole;
  final String? id;
  final String? freelancername;
  final String? phone;
  final Speciality? speciality;
  final String? email;
  final Country? country;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final Currency? currency;
  final int? v;
  final String? password;
  final String? deviceToken;

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      userRole: json["user_role"],
      id: json["_id"],
      freelancername: json["freelancername"],
      phone: json["phone"],
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      email: json["email"],
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      currency:
          json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      v: json["__v"],
      password: json["password"],
      deviceToken: json["deviceToken"],
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

class Speciality {
  Speciality({
    required this.id,
    required this.speciality,
    required this.subSpeciality,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? speciality;
  final String? subSpeciality;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json["_id"],
      speciality: json["speciality"],
      subSpeciality: json["sub_speciality"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
