class NoteModel {
  NoteModel({
    required this.notes,
  });

  final List<Note> notes;

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      notes: json["notes"] == null
          ? []
          : List<Note>.from(json["notes"]!.map((x) => Note.fromJson(x))),
    );
  }
}

class Note {
  Note({
    required this.id,
    required this.content,
    required this.userId,
    required this.taskId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? content;
  final UserId? userId;
  final TaskId? taskId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json["_id"],
      content: json["content"],
      userId: json["user_id"] == null ? null : UserId.fromJson(json["user_id"]),
      taskId: json["task_id"] == null ? null : TaskId.fromJson(json["task_id"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class TaskId {
  TaskId({
    required this.id,
    required this.title,
    required this.serialNumber,
    required this.description,
    required this.channel,
    required this.client,
    required this.speciality,
    required this.country,
    required this.deadline,
    required this.createdBy,
    required this.accepted,
    required this.taskCurrency,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.directTo,
    required this.taskStatus,
    required this.paid,
    required this.acceptedBy,
    required this.cost,
    required this.freelancer,
  });

  final String? id;
  final String? title;
  final String? serialNumber;
  final String? description;
  final String? channel;
  final String? client;
  final String? speciality;
  final String? country;
  final DateTime? deadline;
  final String? createdBy;
  final bool? accepted;
  final String? taskCurrency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? directTo;
  final String? taskStatus;
  final int? paid;
  final String? acceptedBy;
  final int? cost;
  final String? freelancer;

  factory TaskId.fromJson(Map<String, dynamic> json) {
    return TaskId(
      id: json["_id"],
      title: json["title"],
      serialNumber: json["serialNumber"],
      description: json["description"],
      channel: json["channel"],
      client: json["client"],
      speciality: json["speciality"],
      country: json["country"],
      deadline: DateTime.tryParse(json["deadline"] ?? ""),
      createdBy: json["created_by"],
      accepted: json["accepted"],
      taskCurrency: json["task_currency"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      directTo: json["direct_to"],
      taskStatus: json["taskStatus"],
      paid: json["paid"],
      acceptedBy: json["accepted_by"],
      cost: json["cost"],
      freelancer: json["freelancer"],
    );
  }
}

class UserId {
  UserId({
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.userRole,
    required this.userType,
    required this.country,
    required this.phone,
    required this.tasksCount,
    required this.completedCount,
    required this.totalGain,
    required this.totalProfit,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.deviceToken,
    required this.speciality,
  });

  final String? id;
  final String? fullname;
  final String? username;
  final String? password;
  final String? userRole;
  final String? userType;
  final String? country;
  final String? phone;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? deviceToken;
  final String? speciality;

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json["_id"],
      fullname: json["fullname"],
      username: json["username"],
      password: json["password"],
      userRole: json["user_role"],
      userType: json["user_type"],
      country: json["country"],
      phone: json["phone"],
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      deviceToken: json["deviceToken"],
      speciality: json["speciality"],
    );
  }
}
