import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/models/products/product.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/provider/providers.dart';

var productControllerProvider = ChangeNotifierProvider((ref) {
  return ProductController(ref);
});

class ProductController extends ChangeNotifier {
  final Ref ref;
  ProductController(this.ref);

  bool loading = false;

  void refresh() {
    notifyListeners();
  }

  Future<Product> getProduct({required int id}) async {
    try {
      var response = await ref.read(apiProvider).launchRequest(
            endPoint: '/product/products/$id',
            method: "GET",
          );
      return Product.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      var response = await ref.read(apiProvider).launchRequest(
            endPoint: '/product/products',
            method: "GET",
          );
      return List.from(response.data).map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  // Method to update an existing product
  Future<void> updateProduct({
    required int id,
    String? name,
    double? price,
    String? description,
    String? categoryId,
    String? imageBase64,
    required BuildContext context,
  }) async {
    loading = true;
    notifyListeners();
    Map<String, dynamic> body = {
      if (name != null) "name": name,
      if (price != null) "price": price,
      if (description != null) "description": description,
      if (categoryId != null) "category_id": categoryId,
      if (imageBase64 != null) "main_image": imageBase64,
    };
    try {
      await ref.read(apiProvider).launchRequest(
            endPoint: '/products/$id',
            method: "PATCH",
            body: body,
          );
      notifyListeners();
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "Product updated successfully.");
    } catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, "Failed to update product: $e");
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(
      {required int id, required BuildContext context}) async {
    try {
      await ref.read(apiProvider).launchRequest(
            endPoint: '/product/products/$id',
            method: "DELETE",
          );
      notifyListeners();
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "Product deleted successfully.");
    } catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, "Failed to delete product: $e");
    }
  }
}
