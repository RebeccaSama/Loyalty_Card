// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Discount {
  bool isActive;
  Discount({
    required this.isActive,
  });

  Discount copyWith({
    bool? isActive,
  }) {
    return Discount(
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isActive': isActive,
    };
  }

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Discount.fromJson(String source) =>
      Discount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Discount(isActive: $isActive)';

  @override
  bool operator ==(covariant Discount other) {
    if (identical(this, other)) return true;

    return other.isActive == isActive;
  }

  @override
  int get hashCode => isActive.hashCode;
}
