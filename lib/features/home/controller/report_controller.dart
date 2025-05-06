import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/models/report_model.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/provider/providers.dart';

final reportControllerProvider =
    StateNotifierProvider<ReportController, ReportState>(
  (ref) => ReportController(ref),
);

class ReportState {
  final List<Report> reports;
  final bool isLoading;
  final Failure? error;

  ReportState({
    this.reports = const [],
    this.isLoading = false,
    this.error,
  });

  ReportState copyWith({
    List<Report>? reports,
    bool? isLoading,
    Failure? error,
  }) {
    return ReportState(
      reports: reports ?? this.reports,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ReportController extends StateNotifier<ReportState> {
  final Ref ref;

  ReportController(this.ref) : super(ReportState());

  Future<void> fetchAllReports() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/report/reports',
            method: 'GET',
          );

      final reports =
          (response.data as List).map((json) => Report.fromJson(json)).toList();

      state = state.copyWith(
        reports: reports,
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

  Future<Report> getReportById(
    String id,
    BuildContext context,
  ) async {
    try {
      state = state.copyWith(isLoading: true);

      final response = await ref.read(apiProvider).launchRequest(
            endPoint: '/report/reports/$id',
            method: 'GET',
          );

      final report = Report.fromJson(response.data);
      state = state.copyWith(isLoading: false);

      return report;
    } on Failure catch (e) {
      if (!context.mounted) return Report.fromJson({});
      CustomToast.showErrorToast(context, e.errorMessage);
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteReport(
    String id,
    BuildContext context,
  ) async {
    try {
      state = state.copyWith(isLoading: true);

      await ref.read(apiProvider).launchRequest(
            endPoint: '/report/reports/$id',
            method: 'DELETE',
          );

      state = state.copyWith(
        reports: state.reports.where((r) => r.id != id).toList(),
        isLoading: false,
      );
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "delete Report successfully.");
    } on Failure catch (e) {
      if (!context.mounted) return;
      CustomToast.showErrorToast(context, e.errorMessage);

      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
