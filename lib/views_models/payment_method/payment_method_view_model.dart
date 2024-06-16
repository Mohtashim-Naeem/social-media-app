import 'dart:async';

import 'package:bloom_app/views/screens/payment_success/payment_success_view.dart';
import 'package:bloom_app/views_models/home/home_view_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethodViewModel extends GetxController {
  bool args = Get.arguments;
  bool isLoading = false;
  void payment() async {
    isLoading = true;
    update();
    Get.delete<HomeViewModel>();
    final pref = await SharedPreferences.getInstance();
    pref.setBool('unlock', true);
    Timer(const Duration(seconds: 2), () {
      Get.to(() => PaymentSuccessView(
            isCategory: !args,
          ));
      isLoading = false;
      update();
    });
  }
}
