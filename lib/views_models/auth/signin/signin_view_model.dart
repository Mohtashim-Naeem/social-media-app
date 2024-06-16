import 'dart:async';

import 'package:bloom_app/views/screens/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInViewModel extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final emailFocus = FocusNode();
  final passFocus = FocusNode();

  bool isPassEye = true;
  bool isLoading = false;

  void changePassObsecure() {
    isPassEye = !isPassEye;
    update();
  }

  void signIn() {
    isLoading = true;
    update();
    Timer(const Duration(seconds: 2), () {
      Get.offAll(const BLooMBottomNavigation());
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      emailController = TextEditingController(text: 'DigniteStudios@gmail.com');
      passController = TextEditingController(text: '@Dignite12');
    }
  }
}
