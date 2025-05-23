// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:loyalty_card/core/models/products/discount.dart';
import 'package:loyalty_card/core/models/products/gallery.dart';

class Product {
  Discount discount;
  String id;
  String name;
  String description;
  int price;
  int oldPrice;
  String imageUrl;
  int stock;
  String categoryId;
  String? souscategoryId;
  List<Gallery> gallery;
  String sku;
  String barcode;
  String brand;
  bool isActive;
  bool popular;
  bool featured;
  bool trending;
  bool moreLove;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Product({
    required this.discount,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
    required this.stock,
    required this.categoryId,
    this.souscategoryId,
    required this.gallery,
    required this.sku,
    required this.barcode,
    required this.brand,
    required this.isActive,
    required this.popular,
    required this.featured,
    required this.trending,
    required this.moreLove,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Product copyWith({
    Discount? discount,
    String? id,
    String? name,
    String? description,
    int? price,
    int? oldPrice,
    String? imageUrl,
    int? stock,
    String? categoryId,
    String? souscategoryId,
    List<Gallery>? gallery,
    String? sku,
    String? barcode,
    String? brand,
    bool? isActive,
    bool? popular,
    bool? featured,
    bool? trending,
    bool? moreLove,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Product(
      discount: discount ?? this.discount,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
      categoryId: categoryId ?? this.categoryId,
      souscategoryId: souscategoryId ?? this.souscategoryId,
      gallery: gallery ?? this.gallery,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      brand: brand ?? this.brand,
      isActive: isActive ?? this.isActive,
      popular: popular ?? this.popular,
      featured: featured ?? this.featured,
      trending: trending ?? this.trending,
      moreLove: moreLove ?? this.moreLove,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'discount': discount.toMap(),
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'imageUrl': imageUrl,
      'stock': stock,
      'categoryId': categoryId,
      'souscategoryId': souscategoryId,
      'gallery': gallery.map((x) => x.toMap()).toList(),
      'sku': sku,
      'barcode': barcode,
      'brand': brand,
      'isActive': isActive,
      'popular': popular,
      'featured': featured,
      'trending': trending,
      'moreLove': moreLove,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      discount: Discount.fromMap(map['discount'] as Map<String, dynamic>),
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      oldPrice: map['oldPrice'] as int,
      imageUrl: map['imageUrl'] as String,
      stock: map['stock'] as int,
      categoryId: map['categoryId'] as String,
      souscategoryId: map['souscategoryId'] != null
          ? map['souscategoryId'] as String
          : null,
      gallery: List<Gallery>.from(
        (map['gallery'] as List<dynamic>).map<Gallery>(
          (x) => Gallery.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sku: map['sku'] as String,
      barcode: map['barcode'] as String,
      brand: map['brand'] as String,
      isActive: map['isActive'] as bool,
      popular: map['popular'] as bool,
      featured: map['featured'] as bool,
      trending: map['trending'] as bool,
      moreLove: map['moreLove'] as bool,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      discount: Discount.fromMap(map['discount'] as Map<String, dynamic>),
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      oldPrice: map['oldPrice'] as int,
      imageUrl: map['imageUrl'] as String,
      stock: map['stock'] as int,
      categoryId: map['categoryId'] as String,
      souscategoryId: map['souscategoryId'] != null
          ? map['souscategoryId'] as String
          : null,
      gallery: List<Gallery>.from(
        (map['gallery'] as List<dynamic>).map<Gallery>(
          (x) => Gallery.fromMap(x as Map<String, dynamic>),
        ),
      ),
      sku: map['sku'] as String,
      barcode: map['barcode'] as String,
      brand: map['brand'] as String,
      isActive: map['isActive'] as bool,
      popular: map['popular'] as bool,
      featured: map['featured'] as bool,
      trending: map['trending'] as bool,
      moreLove: map['moreLove'] as bool,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] as int,
    );
  }

  // factory Product.fromJson(String source) =>
  //     Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(discount: $discount, id: $id, name: $name, description: $description, price: $price, oldPrice: $oldPrice, imageUrl: $imageUrl, stock: $stock, categoryId: $categoryId, souscategoryId: $souscategoryId, gallery: $gallery, sku: $sku, barcode: $barcode, brand: $brand, isActive: $isActive, popular: $popular, featured: $featured, trending: $trending, moreLove: $moreLove, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.discount == discount &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.oldPrice == oldPrice &&
        other.imageUrl == imageUrl &&
        other.stock == stock &&
        other.categoryId == categoryId &&
        other.souscategoryId == souscategoryId &&
        listEquals(other.gallery, gallery) &&
        other.sku == sku &&
        other.barcode == barcode &&
        other.brand == brand &&
        other.isActive == isActive &&
        other.popular == popular &&
        other.featured == featured &&
        other.trending == trending &&
        other.moreLove == moreLove &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return discount.hashCode ^
        id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        imageUrl.hashCode ^
        stock.hashCode ^
        categoryId.hashCode ^
        souscategoryId.hashCode ^
        gallery.hashCode ^
        sku.hashCode ^
        barcode.hashCode ^
        brand.hashCode ^
        isActive.hashCode ^
        popular.hashCode ^
        featured.hashCode ^
        trending.hashCode ^
        moreLove.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
