class OneClientModel {
  OneClientModel({
    required this.client,
    required this.clientTasks,
    required this.clientAccount,
  });

  final OneClientModelClient? client;
  final List<ClientTask> clientTasks;
  final List<ClientAccount> clientAccount;

  factory OneClientModel.fromJson(Map<String, dynamic> json) {
    return OneClientModel(
      client: json["client"] == null
          ? null
          : OneClientModelClient.fromJson(json["client"]),
      clientTasks: json["clientTasks"] == null
          ? []
          : List<ClientTask>.from(
              json["clientTasks"]!.map((x) => ClientTask.fromJson(x))),
      clientAccount: json["clientAccount"] == null
          ? []
          : List<ClientAccount>.from(
              json["clientAccount"]!.map((x) => ClientAccount.fromJson(x))),
    );
  }
}

class OneClientModelClient {
  OneClientModelClient({
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

  factory OneClientModelClient.fromJson(Map<String, dynamic> json) {
    return OneClientModelClient(
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

class ClientAccount {
  ClientAccount({
    required this.id,
    required this.owner,
    required this.title,
    required this.type,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? owner;
  final String? title;
  final String? type;
  final int? balance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory ClientAccount.fromJson(Map<String, dynamic> json) {
    return ClientAccount(
      id: json["_id"],
      owner: json["owner"],
      title: json["title"],
      type: json["type"],
      balance: json["balance"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class ClientTask {
  ClientTask({
    required this.id,
    required this.title,
    required this.serialNumber,
    required this.description,
    required this.channel,
    required this.client,
    required this.speciality,
    required this.country,
    required this.taskStatus,
    required this.deadline,
    required this.createdBy,
    required this.showCreated,
    required this.accepted,
    required this.taskCurrency,
    required this.paid,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.acceptedBy,
    required this.cost,
    required this.freelancer,
    required this.profitAmount,
    required this.directTo,
    required this.file,
  });

  final String? id;
  final String? title;
  final String? serialNumber;
  final String? description;
  final String? channel;
  final ClientTaskClient? client;
  final Speciality? speciality;
  final Country? country;
  final TaskStatus? taskStatus;
  final DateTime? deadline;
  final TedBy? createdBy;
  final String? showCreated;
  final bool? accepted;
  final Currency? taskCurrency;
  final int? paid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final TedBy? acceptedBy;
  final int? cost;
  final Freelancer? freelancer;
  final int? profitAmount;
  final String? directTo;
  final String? file;

  factory ClientTask.fromJson(Map<String, dynamic> json) {
    return ClientTask(
      id: json["_id"],
      title: json["title"],
      serialNumber: json["serialNumber"],
      description: json["description"],
      channel: json["channel"],
      client: json["client"] == null
          ? null
          : ClientTaskClient.fromJson(json["client"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      taskStatus: json["taskStatus"] == null
          ? null
          : TaskStatus.fromJson(json["taskStatus"]),
      deadline: DateTime.tryParse(json["deadline"] ?? ""),
      createdBy: json["created_by"] == null
          ? null
          : TedBy.fromJson(json["created_by"]),
      showCreated: json["show_created"],
      accepted: json["accepted"],
      taskCurrency: json["task_currency"] == null
          ? null
          : Currency.fromJson(json["task_currency"]),
      paid: json["paid"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      acceptedBy: json["accepted_by"] == null
          ? null
          : TedBy.fromJson(json["accepted_by"]),
      cost: json["cost"],
      freelancer: json["freelancer"] == null
          ? null
          : Freelancer.fromJson(json["freelancer"]),
      profitAmount: json["profit_amount"],
      directTo: json["direct_to"],
      file: json["file"],
    );
  }
}

class TedBy {
  TedBy({
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

  factory TedBy.fromJson(Map<String, dynamic> json) {
    return TedBy(
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

class ClientTaskClient {
  ClientTaskClient({
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

  factory ClientTaskClient.fromJson(Map<String, dynamic> json) {
    return ClientTaskClient(
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
