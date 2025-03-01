import 'dart:convert';

class Localisations {
  final String title;
  Localisations({
    required this.title,
  });

  Localisations copyWith({
    String? title,
  }) {
    return Localisations(title: title ?? this.title);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Localisations.fromMap(Map<String, dynamic> map) {
    return Localisations(
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Localisations.fromJson(String source) =>
      Localisations.fromMap(json.decode(source));

  @override
  String toString() => 'Onboarding(title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Localisations && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
