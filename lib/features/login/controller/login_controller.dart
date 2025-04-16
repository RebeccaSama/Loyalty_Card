import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/features/verification/verification_view.dart';
import 'package:loyalty_card/provider/providers.dart';

import '../../../core/enums/enums.dart';
final loginControllerProvider =
    ChangeNotifierProvider((ref) => LoginController(ref));

class LoginController extends ChangeNotifier {
  final Ref ref;
  LoginController(this.ref);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      await ref.read(apiProvider).launchRequest(
          endPoint: "auth/login",
          method: "POST",
          body: {
            "email": emailController.text,
            "password": passwordController.text
          });
          if (!context.mounted)return;
           Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationView()));
    } on Failure catch (e) {

      e;
    } on ErrorTypes catch (e) {
      e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
