import 'dart:async';

import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:bloom_app/views_models/auth/signup/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordViewModel extends SignUpViewModel {
  TextEditingController currentPassword = TextEditingController();
  final currentPasswordFocus = FocusNode();
  bool isDisable = true;
  bool isCurrentPassEye = true;

  void currentPassObsecure() {
    isCurrentPassEye = !isCurrentPassEye;
    update();
  }

  void checkValidation() {
    isDisable = Utils.validatePassword(currentPassword.text) == null &&
            Utils.confirmValidatePassword(
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
      Get.offAll(() => const SignInView());
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      currentPassword = TextEditingController(text: '@Hayat11');
      passController = TextEditingController(text: '@Dignite12');
      confirmPassController = TextEditingController(text: '@Dignite12');
      checkValidation();
    }
  }
}
