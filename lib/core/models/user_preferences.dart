
class UserPreferences {
  final String language;
  final bool notifications;

  UserPreferences({
    required this.language,
    required this.notifications,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      language: json['language'] as String,
      notifications: json['notifications'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'notifications': notifications,
    };
  }
}