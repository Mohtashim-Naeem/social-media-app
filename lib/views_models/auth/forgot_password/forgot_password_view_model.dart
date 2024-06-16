import 'dart:async';

import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/auth/verification_screen/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordViewModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  final emailFocus = FocusNode();

  bool isLoading = false;
  bool isDisable = true;

  checkValidation() {
    isDisable =
        Utils.validateEmail(emailController.text) == null ? false : true;
    update();
  }

  void verifyForgotEmail() {
    isLoading = true;
    update();
    Timer(const Duration(seconds: 1), () {
      Get.to(
          () => VerificationScreen(
                email: emailController.text,
              ),
          arguments: false);
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController(text: 'DigniteStudios@gmail.com');
    checkValidation();
  }
}
