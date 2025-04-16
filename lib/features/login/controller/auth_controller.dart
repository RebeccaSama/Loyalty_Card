import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/utils/storage.dart';
import 'package:loyalty_card/core/utils/toast_service.dart';
import 'package:loyalty_card/features/login/login_page.dart';
import 'package:loyalty_card/provider/providers.dart';

import '../../../core/enums/enums.dart';

final authControllerProvider =
    ChangeNotifierProvider((ref) => AuthController(ref));

class AuthController extends ChangeNotifier {
  final Ref ref;
  AuthController(this.ref);

  bool isLoading = false;

  Future<bool> refreshToken() async {
    try {
      final refreshToken = await storage.read(key: "refreshToken");

      if (refreshToken == null) {
        return false;
      }

      final response = await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/refresh-token",
        method: "POST",
        body: {"refreshToken": refreshToken},
      );

      if (response.isSuccessful && response.data != null) {
        await storage.write(
          key: "accessToken",
          value: response.data["accessToken"],
        );

        if (response.data["refreshToken"] != null) {
          await storage.write(
            key: "refreshToken",
            value: response.data["refreshToken"],
          );
        }

        return true;
      }

      return false;
    } on Failure catch (e) {
      debugPrint("Erreur de rafraîchissement du token: ${e.errorMessage}");
      return false;
    } on ErrorTypes catch (e) {
      debugPrint("Erreur de rafraîchissement du token: $e");
      return false;
    } catch (e) {
      debugPrint("Erreur inattendue: $e");
      return false;
    }
  }

  Future<bool> isTokenExpired() async {
    try {
      final token = await storage.read(key: "accessToken");
      if (token == null) return true;

      final response = await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/verify-token",
        method: "GET",
        headers: {"Authorization": "Bearer $token"},
      );

      return !response.isSuccessful;
    } catch (e) {
      return true;
    }
  }

  Future<String?> getValidToken() async {
    final token = await storage.read(key: "accessToken");

    if (token == null) return null;

    if (await isTokenExpired()) {
      final refreshSuccess = await refreshToken();
      if (!refreshSuccess) {
        return null;
      }
      return await storage.read(key: "accessToken");
    }

    return token;
  }

  Future<void> handleTokenExpiration(BuildContext context) async {
    final token = await getValidToken();
    if (token == null) {
      await storage.deleteAll();
      if (!context.mounted) return;

      ToastService.showWarning("Session expirée, veuillez vous reconnecter");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final token = await storage.read(key: "accessToken");

      if (token == null) {
        ToastService.showError("Session expirée");
        if (!context.mounted) return;
        _redirectToLogin(context);
        return;
      }

      final response = await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/logout",
        method: "POST",
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.isSuccessful) {
        await storage.delete(key: "accessToken");
        await storage.delete(key: "user");

        if (!context.mounted) return;

        ToastService.showSuccess("Déconnexion réussie");
        _redirectToLogin(context);
      }
    } on Failure catch (e) {
      ToastService.showError(e.errorMessage);
      if (!context.mounted) return;
      await _clearStorageAndRedirect(context);
    } on ErrorTypes catch (e) {
      ToastService.showError("Une erreur s'est produite: ${e.toString()}");
      if (!context.mounted) return;
      await _clearStorageAndRedirect(context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _clearStorageAndRedirect(BuildContext context) async {
    await storage.delete(key: "accessToken");
    await storage.delete(key: "user");
    if (!context.mounted) return;
    _redirectToLogin(context);
  }

  void _redirectToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
