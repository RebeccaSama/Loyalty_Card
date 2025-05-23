// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:loyalty_card/core/models/products/product.dart';

class FlashSale {
  final String id;
  final Product product;
  final DateTime startDate;
  final DateTime endDate;
  final int discountPercentage;
  final int stock;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  FlashSale({
    required this.id,
    required this.product,
    required this.startDate,
    required this.endDate,
    required this.discountPercentage,
    required this.stock,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  FlashSale copyWith({
    String? id,
    Product? product,
    DateTime? startDate,
    DateTime? endDate,
    int? discountPercentage,
    int? stock,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return FlashSale(
      id: id ?? this.id,
      product: product ?? this.product,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'discountPercentage': discountPercentage,
      'stock': stock,
      'isActive': isActive,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory FlashSale.fromMap(Map<String, dynamic> map) {
    return FlashSale(
      id: map['_id'] as String,
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      discountPercentage: map['discountPercentage'] as int,
      stock: map['stock'] as int,
      isActive: map['isActive'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  // factory FlashSale.fromJson(String source) =>
  //     FlashSale.fromMap(json.decode(source) as Map<String, dynamic>);
  factory FlashSale.fromJson(Map<String, dynamic> map) {
    return FlashSale(
      id: map['_id'] as String,
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      discountPercentage: map['discountPercentage'] as int,
      stock: map['stock'] as int,
      isActive: map['isActive'] as bool,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] as int,
    );
  }
  @override
  String toString() {
    return 'FlashSale(id: $id, product: $product, startDate: $startDate, endDate: $endDate, discountPercentage: $discountPercentage, stock: $stock, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant FlashSale other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.product == product &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.discountPercentage == discountPercentage &&
        other.stock == stock &&
        other.isActive == isActive &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        product.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        discountPercentage.hashCode ^
        stock.hashCode ^
        isActive.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
