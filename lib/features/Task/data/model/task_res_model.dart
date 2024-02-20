class TaskModel {
  TaskModel({
    required this.tasks,
    required this.tasksCount,
    required this.completedCount,
    required this.totalCost,
    required this.totalGain,
    required this.totalProfit,
    required this.totalProfitPercentage,
  });

  final List<Task> tasks;
  final int? tasksCount;
  final int? completedCount;
  final int? totalCost;
  final int? totalGain;
  final int? totalProfit;
  final dynamic totalProfitPercentage;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      tasks: json["tasks"] == null
          ? []
          : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalCost: json["totalCost"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      totalProfitPercentage: json["totalProfitPercentage"],
    );
  }
}

class Task {
  Task({
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
    required this.taskStatus,
    required this.paid,
    required this.acceptedBy,
    required this.directTo,
    required this.file,
    required this.cost,
    required this.freelancer,
    required this.showCreated,
    required this.profitAmount,
  });

  final String? id;
  final String? title;
  final String? serialNumber;
  final String? description;
  final String? channel;
  final Client? client;
  final Speciality? speciality;
  final Country? country;
  final DateTime? deadline;
  final AcceptedBy? createdBy;
  final bool? accepted;
  final TaskCurrency? taskCurrency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final TaskStatus? taskStatus;
  final int? paid;
  final AcceptedBy? acceptedBy;
  final String? directTo;
  final String? file;
  final int? cost;
  final Freelancer? freelancer;
  final AcceptedBy? showCreated;
  final int? profitAmount;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["_id"],
      title: json["title"],
      serialNumber: json["serialNumber"],
      description: json["description"],
      channel: json["channel"],
      client: json["client"] == null ? null : Client.fromJson(json["client"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      deadline: DateTime.tryParse(json["deadline"] ?? ""),
      createdBy: json["created_by"] == null
          ? null
          : AcceptedBy.fromJson(json["created_by"]),
      accepted: json["accepted"],
      taskCurrency: json["task_currency"] == null
          ? null
          : TaskCurrency.fromJson(json["task_currency"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      taskStatus: json["taskStatus"] == null
          ? null
          : TaskStatus.fromJson(json["taskStatus"]),
      paid: json["paid"],
      acceptedBy: json["accepted_by"] == null
          ? null
          : AcceptedBy.fromJson(json["accepted_by"]),
      directTo: json["direct_to"],
      file: json["file"],
      cost: json["cost"],
      freelancer: json["freelancer"] == null
          ? null
          : Freelancer.fromJson(json["freelancer"]),
      showCreated: json["show_created"] == null
          ? null
          : AcceptedBy.fromJson(json["show_created"]),
      profitAmount: json["profit_amount"],
    );
  }
}

class AcceptedBy {
  AcceptedBy({
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

  factory AcceptedBy.fromJson(Map<String, dynamic> json) {
    return AcceptedBy(
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
  final String? country;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final String? currency;
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
      country: json["country"],
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      currency: json["currency"],
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
  });

  final String? userRole;
  final String? id;
  final String? freelancername;
  final String? phone;
  final String? speciality;
  final String? email;
  final String? country;
  final int? tasksCount;
  final int? completedCount;
  final int? totalGain;
  final int? totalProfit;
  final String? currency;
  final int? v;

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      userRole: json["user_role"],
      id: json["_id"],
      freelancername: json["freelancername"],
      phone: json["phone"],
      speciality: json["speciality"],
      email: json["email"],
      country: json["country"],
      tasksCount: json["tasksCount"],
      completedCount: json["completedCount"],
      totalGain: json["totalGain"],
      totalProfit: json["totalProfit"],
      currency: json["currency"],
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

class TaskCurrency {
  TaskCurrency({
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

  factory TaskCurrency.fromJson(Map<String, dynamic> json) {
    return TaskCurrency(
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

class TaskStatus {
  TaskStatus({
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

  factory TaskStatus.fromJson(Map<String, dynamic> json) {
    return TaskStatus(
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
