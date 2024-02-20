class OneStatusModel {
  OneStatusModel({
    required this.message,
  });

  final Message? message;

  factory OneStatusModel.fromJson(Map<String, dynamic> json) {
    return OneStatusModel(
      message:
          json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }
}

class Message {
  Message({
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

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
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
