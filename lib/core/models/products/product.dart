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
  int rating;
  List<Gallery> gallery;
  String category;
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
    required this.rating,
    required this.gallery,
    required this.category,
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        discount: Discount.fromJson(json["discount"]),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        imageUrl: json["imageUrl"],
        stock: json["stock"],
        rating: json["rating"],
        gallery:
            List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
        category: json["category"],
        sku: json["sku"],
        barcode: json["barcode"],
        brand: json["brand"],
        isActive: json["isActive"],
        popular: json["popular"],
        featured: json["featured"],
        trending: json["trending"],
        moreLove: json["moreLove"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "discount": discount.toJson(),
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "oldPrice": oldPrice,
        "imageUrl": imageUrl,
        "stock": stock,
        "rating": rating,
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
        "category": category,
        "sku": sku,
        "barcode": barcode,
        "brand": brand,
        "isActive": isActive,
        "popular": popular,
        "featured": featured,
        "trending": trending,
        "moreLove": moreLove,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
