
import 'package:loyalty_card/core/models/purchase.dart';

class Scan {
  String userId;
  List<Purchase> achats;
  int totalAmount;
  int pointsEarned;

  Scan({
    required this.userId,
    required this.achats,
    required this.totalAmount,
    required this.pointsEarned,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        userId: json["userId"],
        achats: List<Purchase>.from(
            json["achats"].map((x) => Purchase.fromJson(x))),
        totalAmount: json["totalAmount"],
        pointsEarned: json["pointsEarned"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "achats": List<dynamic>.from(achats.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "pointsEarned": pointsEarned,
      };
}
