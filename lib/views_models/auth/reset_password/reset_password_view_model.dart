import 'dart:async';

import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:bloom_app/views_models/auth/signup/signup_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPasswordViewModel extends SignUpViewModel {
  bool isDisable = true;

  void checkValidation() {
    isDisable = Utils.confirmValidatePassword(
                passController.text, confirmPassController.text) ==
            null
        ? false
        : true;
    update();
  }

  void resetPassword() {
    isLoading = true;
    update();
    Timer(const Duration(seconds: 2), () {
      isLoading = false;
      update();
      Get.dialog(
        Utils.successDialog(
            context: Get.context!,
            text: 'You have successfully updated your password!',
            onCross: () {
              Get.offAll(() => const SignInView());
            }),
      );
      // Get.offAll(() => const SignInView());
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      passController = TextEditingController(text: '@Dignite12');
      confirmPassController = TextEditingController(text: '@Dignite12');
      checkValidation();
    }
  }
}
