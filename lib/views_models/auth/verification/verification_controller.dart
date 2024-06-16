import 'dart:async';
import 'package:bloom_app/views/screens/auth/reset_password/reset_password_view.dart';
import 'package:bloom_app/views/screens/onboard/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final bool args = Get.arguments;
  TextEditingController otpController = TextEditingController();
  final verficationCodeNode = FocusNode();
  RxBool disableButton = true.obs;
  RxInt resendSeconds = 0.obs;
  Timer? _resendTimer;
  RxBool isLoading = false.obs;

  RxInt resendCount = 0.obs;
  RxString formattedTime = ''.obs;

  startResendTimer() {
    if (resendCount < 3) {
      verficationCodeNode.unfocus();
      _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        resendSeconds = --resendSeconds;
        if (resendSeconds < 1) {
          _stopresendTimer();
        }
      });
    } else {
      resendSeconds.value = 600;
      _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        int minutes = resendSeconds ~/ 60;
        var seconds = resendSeconds % 60;

        formattedTime.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

        resendSeconds = --resendSeconds;
        if (resendSeconds.value < 1) {
          resendCount.value = 0;
          _stopresendTimer();
        }
      });
    }
  }

  void _stopresendTimer() {
    if (_resendTimer!.isActive) {
      _resendTimer!.cancel();
    }
  }

  buttonVisibilty() {
    if (otpController.text.length == 4) {
      disableButton.value = false;
    } else {
      disableButton.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    resendSeconds.value = 60;
    startResendTimer();
    if (kDebugMode) {
      otpController = TextEditingController(text: '2222');

      buttonVisibilty();
    }
  }

  void resendOtp() {} //resend otp api function

  void otpVerify() {
    args //if it is true it will be route on starter page else reset password because i am using 1 verification for reset pass or signup
        ? Get.to(() => OnBoardView())
        : Get.to(() => const ResetPasswordView());
  }
}
