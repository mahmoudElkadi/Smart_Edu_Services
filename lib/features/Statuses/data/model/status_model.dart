class StatusModel {
  StatusModel({
    required this.statuses,
  });

  final List<Status> statuses;

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      statuses: json["statuses"] == null
          ? []
          : List<Status>.from(json["statuses"]!.map((x) => Status.fromJson(x))),
    );
  }
}

class Status {
  Status({
    required this.id,
    required this.statusname,
    required this.slug,
    required this.role,
    required this.changable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? statusname;
  final String? slug;
  final String? role;
  final bool? changable;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json["_id"],
      statusname: json["statusname"],
      slug: json["slug"],
      role: json["role"],
      changable: json["changable"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
