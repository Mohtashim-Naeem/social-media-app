import 'dart:async';

import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  late Timer time;

  routePage() {
    time.cancel();
    Navigator.pushReplacement(
      Get.context!,
      MaterialPageRoute(
        builder: ((context) => const SignInView()),
      ),
    );
  }

  @override
  void onReady() async {
    super.onReady();

    time = Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const SignInView());
    });
  }
}
