import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views_models/auth/signin/signin_view_model.dart';
import 'package:flutter/material.dart';

class DeleteAccountViewModel extends SignInViewModel {
  bool isDisable = true;

  checkValidation() {
    isDisable =
        Utils.validatePassword(passController.text) == null ? false : true;
    update();
  }

  // void verifyForgotEmail() {
  //   isLoading = true;
  //   update();
  //   Timer(const Duration(seconds: 1), () {
  //     Get.to(
  //         () => VerificationScreen(
  //               email: emailController.text,
  //             ),
  //         arguments: false);
  //     isLoading = false;
  //     update();
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
    passController = TextEditingController(text: '@Dignite12');
    checkValidation();
  }
}
