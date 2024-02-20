class OneSpecialityModel {
  OneSpecialityModel({
    required this.speciality,
  });

  final Speciality? speciality;

  factory OneSpecialityModel.fromJson(Map<String, dynamic> json) {
    return OneSpecialityModel(
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
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
