import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/models/flash-sale/flash_sale.dart';
import 'package:loyalty_card/provider/providers.dart';

// Provider pour stocker les flash sales
final flashSalesProvider =
    StateNotifierProvider<FlashSaleNotifier, AsyncValue<List<FlashSale>>>(
        (ref) {
  return FlashSaleNotifier(ref);
});

class FlashSaleNotifier extends StateNotifier<AsyncValue<List<FlashSale>>> {
  final Ref ref;
  FlashSaleNotifier(this.ref) : super(const AsyncValue.loading()) {
    // Charger les données au démarrage
    loadFlashSales();
  }

  Future<void> loadFlashSales() async {
    try {
      state = const AsyncValue.loading();
      final flashSales = await _fetchFlashSales();
      state = AsyncValue.data(flashSales);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<List<FlashSale>> _fetchFlashSales() async {
    try {
      var response = await ref.read(apiProvider).launchRequest(
            endPoint: '/flashSaleProduct/flash-sale',
            method: "GET",
          );
      return List.from(response.data)
          .map((e) => FlashSale.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch flash sales: $e');
    }
  }

  // Méthode pour forcer un rafraîchissement des données
  Future<void> refresh() async {
    await loadFlashSales();
  }
}
