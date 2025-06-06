import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/features/bottom_navigation/bottom_navigation.dart';
import 'package:loyalty_card/features/login/login_view.dart';
import 'package:loyalty_card/features/login/widgets/full_screen_loader.dart';
import 'package:loyalty_card/provider/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../core/enums/enums.dart';

final loginControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return LoginController(ref);
});

class LoginController extends ChangeNotifier {
  final Ref ref;
  LoginController(this.ref) {
    phoneNumberController.addListener(() {
      notifyListeners();
    });
  }

  final TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      phoneNumberController.text =
          phoneNumberController.text.replaceAll(" ", "");
      final response = await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/login",
        method: "POST",
        body: {"phoneNumber": phoneNumberController.text},
      );

      final accessToken = response.data['token'];
      final user = response.data['user'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', accessToken);
      await prefs.setString('user', jsonEncode(user));
      print(accessToken);
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "User login successfully");

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()));
    } on Failure catch (e, _) {
      CustomToast.showErrorToast(context, e.errorMessage);
      e;
    } on ErrorTypes catch (e) {
      CustomToast.showWarningToast(context, "No connexion internet");
      e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const FullScreenLoader(
            message: "Déconnexion en cours...",
          ),
        );
        isLoading = true;
      }

      final token = prefs.getString('token');

      await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/logout",
        method: "POST",
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      await prefs.remove('token');
      await prefs.remove('user');

      if (context.mounted) {
        CustomToast.showSuccessToast(context, "Déconnexion réussie");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      }
    } on Failure catch (e) {
      if (context.mounted) {
        CustomToast.showErrorToast(context, e.errorMessage);
      }
    } on ErrorTypes catch (_) {
      if (context.mounted) {
        CustomToast.showWarningToast(context, "Pas de connexion internet");
      }
    } finally {
      if (isLoading && context.mounted) {
        Navigator.of(context).pop();
      }
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');

    if (userString == null) return null;
    return jsonDecode(userString) as Map<String, dynamic>;
  }
}
