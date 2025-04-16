import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    String accessToken;
    User user;

    AuthModel({
        required this.accessToken,
        required this.user,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
    };
}

class User {
    String fullName;
    String email;
    String role;
    int points;
    int wallet;
    String phoneNumber;
    Preferences preferences;
    List<dynamic> transactions;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String refreshToken;

    User({
        required this.fullName,
        required this.email,
        required this.role,
        required this.points,
        required this.wallet,
        required this.phoneNumber,
        required this.preferences,
        required this.transactions,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.refreshToken,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        email: json["email"],
        role: json["role"],
        points: json["points"],
        wallet: json["wallet"],
        phoneNumber: json["phoneNumber"],
        preferences: Preferences.fromJson(json["preferences"]),
        transactions: List<dynamic>.from(json["transactions"].map((x) => x)),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "role": role,
        "points": points,
        "wallet": wallet,
        "phoneNumber": phoneNumber,
        "preferences": preferences.toJson(),
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "refreshToken": refreshToken,
    };
}

class Preferences {
    String language;
    bool notifications;

    Preferences({
        required this.language,
        required this.notifications,
    });

    factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        language: json["language"],
        notifications: json["notifications"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "notifications": notifications,
    };
}