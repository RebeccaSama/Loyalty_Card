import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/models/point-of-sale/point_of_sale.dart';
import 'package:loyalty_card/provider/providers.dart';

var pointOfSaleControllerProvider = ChangeNotifierProvider((ref) {
  return PointOfSaleController(ref);
});

class PointOfSaleController extends ChangeNotifier {
  final Ref ref;
  PointOfSaleController(this.ref);

  bool loading = false;

  void refresh() {
    notifyListeners();
  }

  Future<PointOfSale> getPointOfSale({required int id}) async {
    try {
      var response = await ref.read(apiProvider).launchRequest(
            endPoint: '/pointOfSale/point-of-sale/$id',
            method: "GET",
          );
      return PointOfSale.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  Future<List<PointOfSale>> getAllPointOfSale() async {
    try {
      var response = await ref.read(apiProvider).launchRequest(
            endPoint: '/pointOfSale/point-of-sale',
            method: "GET",
          );
      return List.from(response.data)
          .map((e) => PointOfSale.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
