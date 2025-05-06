// offer_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/models/offers/offer.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/provider/providers.dart';

final offerControllerProvider =
    StateNotifierProvider<OfferController, OfferState>(
  (ref) => OfferController(ref),
);

class OfferState {
  final List<Offer> offers;
  final bool isLoading;
  final Failure? error;

  OfferState({
    this.offers = const [],
    this.isLoading = false,
    this.error,
  });

  OfferState copyWith({
    List<Offer>? offers,
    bool? isLoading,
    Failure? error,
  }) {
    return OfferState(
      offers: offers ?? this.offers,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class OfferController extends StateNotifier<OfferState> {
  final Ref ref;

  OfferController(this.ref) : super(OfferState());

  Future<void> fetchAllOffers() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/offer/offers',
            method: 'GET',
          );

      final offers =
          (response.data as List).map((json) => Offer.fromJson(json)).toList();

      state = state.copyWith(
        offers: offers,
        isLoading: false,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        error: e,
        isLoading: false,
      );
      rethrow;
    }
  }

  Future<void> createOffer(Offer offer, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/offer/offers',
            method: 'POST',
            body: offer.toJson(),
          );

      final newOffer = Offer.fromJson(response.data);
      state = state.copyWith(
        offers: [...state.offers, newOffer],
        isLoading: false,
      );
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "Create offer ok!");
    } on Failure catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> updateOffer(String id, Offer offer, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/offer/offers/$id',
            method: 'PUT',
            body: offer.toJson(),
          );

      final updatedOffer = Offer.fromJson(response.data);
      state = state.copyWith(
        offers: state.offers.map((o) => o.id == id ? updatedOffer : o).toList(),
        isLoading: false,
      );
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "Update offer ok!");
    } on Failure catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteOffer(String id, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      await ref.read(apiProvider).launchRequest(
            endPoint: '/offer/offers/$id',
            method: 'DELETE',
          );

      state = state.copyWith(
        offers: state.offers.where((o) => o.id != id).toList(),
        isLoading: false,
      );
      if (!context.mounted) return;

      CustomToast.showSuccessToast(context, "Delete offer ok!");
    } on Failure catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> toggleActivation(
      String id, bool isActive, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      await ref.read(apiProvider).launchRequest(
        endPoint: '/offers/$id/activation',
        method: 'PATCH',
        body: {'isActive': isActive},
      );

      state = state.copyWith(
        offers: state.offers
            .map((o) => o.id == id
                ? Offer(
                    id: o.id,
                    title: o.title,
                    description: o.description,
                    discount: o.discount,
                    startDate: o.startDate,
                    endDate: o.endDate,
                    targetAudience: o.targetAudience,
                    isActive: isActive,
                    v: o.v,
                  )
                : o)
            .toList(),
        isLoading: false,
      );
    } on Failure catch (e) {
      if (!context.mounted) throw Exception('Context is not mounted');
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
