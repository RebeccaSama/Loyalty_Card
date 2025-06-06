import 'package:loyalty_card/core/models/products/product.dart';

class Purchase {
  Product product;
  int price;
  int quantity;
  String id;

  Purchase({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        product: Product.fromJson(json["product"]),
        price: json["price"],
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "price": price,
        "quantity": quantity,
        "_id": id,
      };
}
