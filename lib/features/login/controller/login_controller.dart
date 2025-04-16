import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/utils/storage.dart';
import 'package:loyalty_card/core/utils/toast_service.dart';
import 'package:loyalty_card/features/verification/verification_view.dart';
import 'package:loyalty_card/provider/providers.dart';

import '../../../core/enums/enums.dart';

final loginControllerProvider =
    ChangeNotifierProvider((ref) => LoginController(ref));

class LoginController extends ChangeNotifier {
  final Ref ref;
  LoginController(this.ref);

  final TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await ref.read(apiProvider).launchRequest(
        endPoint: "/auth/login",
        method: "POST",
        body: {"phoneNumber": phoneNumberController.text.trim()},
      );
      await storage.write(
          key: "accessToken", value: response.data["accessToken"]);
      await storage.write(key: "user", value: response.data["user"].toJson());
      if (!context.mounted) return;
      ToastService.showSuccess("Connexion réussie !");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VerificationView()),
      );
    } on Failure catch (e) {
      ToastService.showError(e.errorMessage);
    } on ErrorTypes catch (e) {
      ToastService.showError("Une erreur s'est produite: ${e.toString()}");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
