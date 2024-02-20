class TransactionModel {
  TransactionModel({
    required this.transactions,
  });

  final List<Transaction> transactions;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      transactions: json["transactions"] == null
          ? []
          : List<Transaction>.from(
              json["transactions"]!.map((x) => Transaction.fromJson(x))),
    );
  }
}

class Transaction {
  Transaction({
    required this.id,
    required this.method,
    required this.accountNumber,
    required this.task,
    required this.amount,
    required this.accountId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? method;
  final String? accountNumber;
  final Task? task;
  final int? amount;
  final AccountId? accountId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["_id"],
      method: json["method"],
      accountNumber: json["accountNumber"],
      task: json["task"] == null ? null : Task.fromJson(json["task"]),
      amount: json["amount"],
      accountId: json["account_id"] == null
          ? null
          : AccountId.fromJson(json["account_id"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class AccountId {
  AccountId({
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

  factory AccountId.fromJson(Map<String, dynamic> json) {
    return AccountId(
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
  });

  final String? id;
  final String? title;
  final String? serialNumber;
  final String? description;
  final String? channel;
  final String? client;
  final String? speciality;
  final String? country;
  final String? taskStatus;
  final DateTime? deadline;
  final String? createdBy;
  final String? showCreated;
  final bool? accepted;
  final String? taskCurrency;
  final int? paid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? acceptedBy;
  final int? cost;
  final String? freelancer;
  final int? profitAmount;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["_id"],
      title: json["title"],
      serialNumber: json["serialNumber"],
      description: json["description"],
      channel: json["channel"],
      client: json["client"],
      speciality: json["speciality"],
      country: json["country"],
      taskStatus: json["taskStatus"],
      deadline: DateTime.tryParse(json["deadline"] ?? ""),
      createdBy: json["created_by"],
      showCreated: json["show_created"],
      accepted: json["accepted"],
      taskCurrency: json["task_currency"],
      paid: json["paid"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      acceptedBy: json["accepted_by"],
      cost: json["cost"],
      freelancer: json["freelancer"],
      profitAmount: json["profit_amount"],
    );
  }
}
