// transaction_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/models/transactions/transaction.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/provider/providers.dart';

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, TransactionState>(
  (ref) => TransactionController(ref),
);

class TransactionState {
  final List<Transaction> transactions;
  final bool isLoading;
  final Failure? error;

  TransactionState({
    this.transactions = const [],
    this.isLoading = false,
    this.error,
  });

  TransactionState copyWith({
    List<Transaction>? transactions,
    bool? isLoading,
    Failure? error,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class TransactionController extends StateNotifier<TransactionState> {
  final Ref ref;

  TransactionController(this.ref) : super(TransactionState());

  Future<void> fetchAllTransactions() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/transaction/transactions',
            method: 'GET',
          );

      final transactions = (response.data as List)
          .map((json) => Transaction.fromJson(json))
          .toList();

      state = state.copyWith(
        transactions: transactions,
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

  Future<Transaction> createTransaction(
      Transaction transaction, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/transaction/transactions',
            method: 'POST',
            body: transaction.toJson(),
          );

      final newTransaction = Transaction.fromJson(response.data);
      state = state.copyWith(
        transactions: [...state.transactions, newTransaction],
        isLoading: false,
      );

      if (!context.mounted) return Transaction.fromJson({});
      CustomToast.showSuccessToast(context, "Create transaction done!");
      return newTransaction;
    } on Failure catch (e) {
      if (!context.mounted) return Transaction.fromJson({});
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<Transaction> updateTransaction(
      String id, Transaction transaction, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/transaction/transactions/$id',
            method: 'PUT',
            body: transaction.toJson(),
          );

      final updatedTransaction = Transaction.fromJson(response.data);
      state = state.copyWith(
        transactions: state.transactions
            .map((t) => t.id == id ? updatedTransaction : t)
            .toList(),
        isLoading: false,
      );
      if (!context.mounted) return Transaction.fromJson({});
      CustomToast.showSuccessToast(context, "update Transaction done!");
      return updatedTransaction;
    } on Failure catch (e) {
      if (!context.mounted) return Transaction.fromJson({});
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteTransaction(String id, BuildContext context) async {
    try {
      state = state.copyWith(isLoading: true);

      await ref.read(apiProvider).launchRequest(
            endPoint: '/transaction/transactions/$id',
            method: 'DELETE',
          );

      state = state.copyWith(
        transactions: state.transactions.where((t) => t.id != id).toList(),
        isLoading: false,
      );
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "Delete transaction done!");
    } on Failure catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<Transaction> getTransactionsById(String id) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/transaction/transactions/$id',
            method: 'GET',
          );

      final transactions = Transaction.fromJson(response.data);

      state = state.copyWith(isLoading: false);
      return transactions;
    } on Failure catch (_) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
