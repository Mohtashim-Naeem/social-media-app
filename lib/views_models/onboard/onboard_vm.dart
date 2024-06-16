import 'dart:async';
import 'package:bloom_app/views/screens/onboard/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardViewmodel extends GetxController {
  double height = 0.0;
  bool isExpanded = false;
  late Timer timer;

  onGestureDetect() {
    timer.cancel();
    Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: ((context) => const UploadProfilePicView()),
      ),
    );
  }

  @override
  void onReady() async {
    super.onReady();

    height = MediaQuery.sizeOf(Get.context!).height * 0.75;
    isExpanded = true;
    update();

    timer = Timer(const Duration(seconds: 2), () {
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: ((context) => const UploadProfilePicView()),
        ),
      );
    });
  }
}
