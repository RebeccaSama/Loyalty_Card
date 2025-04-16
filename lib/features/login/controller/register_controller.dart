import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
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
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      await ref.read(apiProvider).launchRequest(
          isFromData: true,
          endPoint: "auth/register",
          method: "POST",
          body: {
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "email": emailController.text,
            "password": passwordController.text
          });
      if (!context.mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SuccesView()));
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
