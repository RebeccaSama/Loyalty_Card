import 'dart:convert';

class Preferences {
  final String language;
  final bool notifications;
  Preferences({
    required this.language,
    required this.notifications,
  });

  Preferences copyWith({
    String? language,
    bool? notifications,
  }) {
    return Preferences(
      language: language ?? this.language,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'notifications': notifications,
    };
  }

  factory Preferences.fromMap(Map<String, dynamic> map) {
    return Preferences(
      language: map['language'] ?? '',
      notifications: map['notifications'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Preferences.fromJson(String source) =>
      Preferences.fromMap(json.decode(source));

  @override
  String toString() =>
      'Preferences(language: $language, notifications: $notifications)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Preferences &&
        other.language == language &&
        other.notifications == notifications;
  }

  @override
  int get hashCode => language.hashCode ^ notifications.hashCode;
}
