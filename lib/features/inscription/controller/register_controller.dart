import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:loyalty_card/core/utils/custom_toast.dart';
import 'package:loyalty_card/features/succes/succes_view.dart';
import 'package:loyalty_card/provider/providers.dart';

import '../../../core/enums/enums.dart';

final registerControllerProvider =
    ChangeNotifierProvider((ref) => RegisterController(ref));

class RegisterController extends ChangeNotifier {
  final Ref ref;
  RegisterController(this.ref) {
    emailController.addListener(() {
      refresh();
    });
    firstNameController.addListener(() {
      refresh();
    });
    lastNameController.addListener(() {
      refresh();
    });
    phoneNumberController.addListener(() {
      refresh();
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isLoading = false;

  void refresh() {
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    print({
      "fullName": "${firstNameController.text}${lastNameController.text}",
      "email": emailController.text,
      "phoneNumber": phoneNumberController.text,
    });
    try {
      isLoading = true;
      notifyListeners();
      var phoneNumber = phoneNumberController.text.replaceAll(" ", "");
      await ref
          .read(apiProvider)
          .launchRequest(endPoint: "/auth/register", method: "POST", body: {
        "fullName": "${firstNameController.text}${lastNameController.text}",
        "email": emailController.text,
        "phoneNumber": phoneNumber,
      });
      if (!context.mounted) return;
      CustomToast.showSuccessToast(context, "User registered successfully");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SuccesView()));
    } on Failure catch (e, _) {
      print(_);
      print(e);
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
}
