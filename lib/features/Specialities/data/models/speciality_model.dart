import 'dart:convert';

List<Speciality> specialityModelFromJson(String str) =>
    List<Speciality>.from(json.decode(str).map((x) => Speciality.fromJson(x)));

class SpecialityModel {
  SpecialityModel({
    required this.specialities,
  });

  final List<Speciality> specialities;

  factory SpecialityModel.fromJson(Map<String, dynamic> json) {
    return SpecialityModel(
      specialities: json["specialities"] == null
          ? []
          : List<Speciality>.from(
              json["specialities"]!.map((x) => Speciality.fromJson(x))),
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
