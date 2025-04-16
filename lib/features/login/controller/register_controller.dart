import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/models/user.dart';
import 'package:loyalty_card/core/utils/storage.dart';
import 'package:loyalty_card/core/utils/toast_service.dart';
import 'package:loyalty_card/features/succes/succes_view.dart';
import 'package:loyalty_card/provider/providers.dart';

import '../../../core/enums/enums.dart';

final registerControllerProvider =
    ChangeNotifierProvider((ref) => RegisterController(ref));

class RegisterController extends ChangeNotifier {
  final Ref ref;
  RegisterController(this.ref);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await ref.read(apiProvider).launchRequest(
        isFromData: true,
        endPoint: "/auth/register",
        method: "POST",
        body: {
          "fullName":
              "${firstNameController.text} ${lastNameController.text}".trim(),
          "email": emailController.text.trim(),
          "phoneNumber": phoneNumberController.text.trim()
        },
      );

      await storage.write(
          key: "accessToken", value: response.data["accessToken"]);
      await storage.write(key: "user", value: response.data["user"].toJson());
      if (!context.mounted) return;
      ToastService.showSuccess("Inscription réussie !");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccesView()),
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
  

  Future<User?> getUser() async {
    final userJson = await storage.read(key: "user");
    return userJson != null ? User.fromJsonString(userJson) : null;
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
