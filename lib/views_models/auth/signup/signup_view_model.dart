import 'dart:async';

import 'package:bloom_app/views/screens/auth/verification_screen/verification_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final confirmPassFocus = FocusNode();

  bool isPassEye = true;
  bool isConfirmPassEye = true;
  bool isLoading = false;

  void changePassObsecure() {
    isPassEye = !isPassEye;
    update();
  }

  void changeConfirmPassObsecure() {
    isConfirmPassEye = !isConfirmPassEye;
    update();
  }

  void signUp() {
    isLoading = true;
    update();
    Timer(const Duration(seconds: 2), () {
      Get.to(
          () => VerificationScreen(
                email: emailController.text,
              ),
          arguments: true);
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      nameController = TextEditingController(text: 'Dignite');
      emailController = TextEditingController(text: 'DigniteStudios@gmail.com');
      passController = TextEditingController(text: '@Dignite12');
      confirmPassController = TextEditingController(text: '@Dignite12');
    }
  }
}
