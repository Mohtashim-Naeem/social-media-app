import 'dart:async';

import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileViewModel extends GetxController {
  final nameController = TextEditingController();
  final aboutController = TextEditingController();
  final nameFocus = FocusNode();
  final aboutFocus = FocusNode();
  final int maxlenth = 300;
  bool isLoading = false;

  save() {
    isLoading = true;
    update();

    Timer(const Duration(seconds: 2), () {
      isLoading = false;

      update();
      Get.offAll(() => const BLooMBottomNavigation());
      Get.dialog(
        Utils.successDialog(
            context: Get.context!,
            text: 'You have Successfully Signed Up!',
            onCross: () {
              Get.back();
            }),
      );
    });
  }

  dynamic Function(String)? onAboutChanges(_) {
    update();
    return null;
  }
}
