class Transaction {
  String userId;
  String type;
  int points;
  int amount;
  String paymentMethod;
  int changeGiven;
  String description;
  String id;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Transaction({
    required this.userId,
    required this.type,
    required this.points,
    required this.amount,
    required this.paymentMethod,
    required this.changeGiven,
    required this.description,
    required this.id,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        userId: json["userId"],
        type: json["type"],
        points: json["points"],
        amount: json["amount"],
        paymentMethod: json["paymentMethod"],
        changeGiven: json["changeGiven"],
        description: json["description"],
        id: json["_id"],
        date: DateTime.parse(json["date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "type": type,
        "points": points,
        "amount": amount,
        "paymentMethod": paymentMethod,
        "changeGiven": changeGiven,
        "description": description,
        "_id": id,
        "date": date.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
