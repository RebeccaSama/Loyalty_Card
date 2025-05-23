// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:loyalty_card/core/models/point-of-sale/manager.dart'
    show Manager;

class PointOfSale {
  String id;
  String name;
  String imageUrl;
  String address;
  String city;
  String country;
  Manager manager;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  PointOfSale({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.city,
    required this.country,
    required this.manager,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  PointOfSale copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? address,
    String? city,
    String? country,
    Manager? manager,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return PointOfSale(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      manager: manager ?? this.manager,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
      'city': city,
      'country': country,
      'manager': manager.toMap(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory PointOfSale.fromMap(Map<String, dynamic> map) {
    return PointOfSale(
      id: map['_id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      manager: Manager.fromMap(map['manager'] as Map<String, dynamic>),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  // factory PointOfSale.fromJson(String source) =>
  //     PointOfSale.fromMap(json.decode(source) as Map<String, dynamic>);
  factory PointOfSale.fromJson(Map<String, dynamic> map) {
    return PointOfSale(
      id: map['_id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      manager: Manager.fromMap(map['manager'] as Map<String, dynamic>),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] as int,
    );
  }
  @override
  String toString() {
    return 'PointOfSale(id: $id, name: $name, imageUrl: $imageUrl, address: $address, city: $city, country: $country, manager: $manager, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant PointOfSale other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.address == address &&
        other.city == city &&
        other.country == country &&
        other.manager == manager &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        address.hashCode ^
        city.hashCode ^
        country.hashCode ^
        manager.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
