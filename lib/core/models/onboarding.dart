import 'dart:convert';

class Onboarding {
  final String title;
  final String subtitle;
  final String image;
  Onboarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
  

  Onboarding copyWith({
    String? title,
    String? subtitle,
    String? image,
  }) {
    return Onboarding(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }

  factory Onboarding.fromMap(Map<String, dynamic> map) {
    return Onboarding(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Onboarding.fromJson(String source) => Onboarding.fromMap(json.decode(source));

  @override
  String toString() => 'Onboarding(title: $title, subtitle: $subtitle, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Onboarding &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ image.hashCode;
}
