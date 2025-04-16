import 'dart:convert';

import 'package:loyalty_card/core/models/user_preferences.dart';


class User {
  final String fullName;
  final String email;
  final String role;
  final int points;
  final int wallet;
  final String phoneNumber;
  final UserPreferences preferences;
  final List<dynamic> transactions;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String accessToken;
  final String refreshToken;

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
    required this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['user']['fullName'] as String,
      email: json['user']['email'] as String,
      role: json['user']['role'] as String,
      points: json['user']['points'] as int,
      wallet: json['user']['wallet'] as int,
      phoneNumber: json['user']['phoneNumber'] as String,
      preferences: UserPreferences.fromJson(json['user']['preferences'] as Map<String, dynamic>),
      transactions: json['user']['transactions'] as List<dynamic>,
      id: json['user']['_id'] as String,
      createdAt: DateTime.parse(json['user']['createdAt'] as String),
      updatedAt: DateTime.parse(json['user']['updatedAt'] as String),
      accessToken: json['accessToken'] as String,
      refreshToken: json['user']['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'user': {
        'fullName': fullName,
        'email': email,
        'role': role,
        'points': points,
        'wallet': wallet,
        'phoneNumber': phoneNumber,
        'preferences': preferences.toJson(),
        'transactions': transactions,
        '_id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'refreshToken': refreshToken,
      },
    };
  }

  String toJsonString() => json.encode(toJson());

  static User fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString) as Map<String, dynamic>);
  }
} 