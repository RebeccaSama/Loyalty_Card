// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsModel {
 
  final String? id;
  final String name;
  final String description;
  final int price;
  final int? oldPrice;
  final String? imageUrl;
  final int? stock;
  final int? rating;
  final int? bonusMarks;
  final Discount? discount;
  final Gallery? gallery;
  final String? category;
  final String? sku;
  final String? barcode;
  final String? brand;
  final bool? isActive;
  final bool? popular;
  final bool? featured;
  final bool? trending;
  final bool? moreLove;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductsModel({
    this.id, 
    required this.name, 
    required this.description, 
    required this.price, 
    this.oldPrice, 
    this.imageUrl, 
    this.stock, 
    this.rating, 
    this.bonusMarks, 
    this.discount, 
    this.gallery, 
    this.category, 
    this.sku, 
    this.barcode, 
    this.brand, 
    this.isActive, 
    this.popular, 
    this.featured, 
    this.trending, 
    this.moreLove, 
    this.createdAt, 
    this.updatedAt
});


  ProductsModel copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    int? oldPrice,
    String? imageUrl,
    int? stock,
    int? rating,
    int? bonusMarks,
    Discount? discount,
    Gallery? gallery,
    String? category,
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
  }) {
    return ProductsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      bonusMarks: bonusMarks ?? this.bonusMarks,
      discount: discount ?? this.discount,
      gallery: gallery ?? this.gallery,
      category: category ?? this.category,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'oldPrice': oldPrice,
      'imageUrl': imageUrl,
      'stock': stock,
      'rating': rating,
      'bonusMarks': bonusMarks,
      'discount': discount?.toMap(),
      'gallery': gallery?.toMap(),
      'category': category,
      'sku': sku,
      'barcode': barcode,
      'brand': brand,
      'isActive': isActive,
      'popular': popular,
      'featured': featured,
      'trending': trending,
      'moreLove': moreLove,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      oldPrice: map['oldPrice'] != null ? map['oldPrice'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      bonusMarks: map['bonusMarks'] != null ? map['bonusMarks'] as int : null,
      discount: map['discount'] != null ? Discount.fromMap(map['discount'] as Map<String,dynamic>) : null,
      gallery: map['gallery'] != null ? Gallery.fromMap(map['gallery'] as Map<String,dynamic>) : null,
      category: map['category'] != null ? map['category'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      barcode: map['barcode'] != null ? map['barcode'] as String : null,
      brand: map['brand'] != null ? map['brand'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      popular: map['popular'] != null ? map['popular'] as bool : null,
      featured: map['featured'] != null ? map['featured'] as bool : null,
      trending: map['trending'] != null ? map['trending'] as bool : null,
      moreLove: map['moreLove'] != null ? map['moreLove'] as bool : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, name: $name, description: $description, price: $price, oldPrice: $oldPrice, imageUrl: $imageUrl, stock: $stock, rating: $rating, bonusMarks: $bonusMarks, discount: $discount, gallery: $gallery, category: $category, sku: $sku, barcode: $barcode, brand: $brand, isActive: $isActive, popular: $popular, featured: $featured, trending: $trending, moreLove: $moreLove, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.oldPrice == oldPrice &&
      other.imageUrl == imageUrl &&
      other.stock == stock &&
      other.rating == rating &&
      other.bonusMarks == bonusMarks &&
      other.discount == discount &&
      other.gallery == gallery &&
      other.category == category &&
      other.sku == sku &&
      other.barcode == barcode &&
      other.brand == brand &&
      other.isActive == isActive &&
      other.popular == popular &&
      other.featured == featured &&
      other.trending == trending &&
      other.moreLove == moreLove &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      oldPrice.hashCode ^
      imageUrl.hashCode ^
      stock.hashCode ^
      rating.hashCode ^
      bonusMarks.hashCode ^
      discount.hashCode ^
      gallery.hashCode ^
      category.hashCode ^
      sku.hashCode ^
      barcode.hashCode ^
      brand.hashCode ^
      isActive.hashCode ^
      popular.hashCode ^
      featured.hashCode ^
      trending.hashCode ^
      moreLove.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
 } 

class Discount {
  final int percentage;
  final DateTime expireDate;
  final bool isActive;

  Discount(
    this.percentage, 
    this.expireDate, 
    this.isActive
    );

  Discount copyWith({
    int? percentage,
    DateTime? expireDate,
    bool? isActive,
  }) {
    return Discount(
      percentage ?? this.percentage,
      expireDate ?? this.expireDate,
      isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percentage': percentage,
      'expireDate': expireDate.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
      map['percentage'] as int,
      DateTime.fromMillisecondsSinceEpoch(map['expireDate'] as int),
      map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Discount.fromJson(String source) => Discount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Discount(percentage: $percentage, expireDate: $expireDate, isActive: $isActive)';

  @override
  bool operator ==(covariant Discount other) {
    if (identical(this, other)) return true;
  
    return 
      other.percentage == percentage &&
      other.expireDate == expireDate &&
      other.isActive == isActive;
  }

  @override
  int get hashCode => percentage.hashCode ^ expireDate.hashCode ^ isActive.hashCode;
 }

class Gallery {
   final String thumb;

  Gallery(
    this.thumb,
  );

  Gallery copyWith({
    String? thumb,
  }) {
    return Gallery(
      thumb ?? this.thumb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumb': thumb,
    };
  }

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      map['thumb'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String source) => Gallery.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Gallery(thumb: $thumb)';

  @override
  bool operator ==(covariant Gallery other) {
    if (identical(this, other)) return true;
  
    return 
      other.thumb == thumb;
  }

  @override
  int get hashCode => thumb.hashCode;
 }
