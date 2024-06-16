import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/screens/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentSuccessViewModel extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => const BLooMBottomNavigation());
  }
}

class PaymentSuccessView extends StatelessWidget with BLooMBackroundMixin {
  PaymentSuccessView({super.key, required this.isCategory});
  final bool isCategory;
  final PaymentSuccessViewModel vm = Get.put(PaymentSuccessViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 42.5.r,
                    backgroundColor: AppColors.magicMint,
                    child: Text(
                      String.fromCharCode(Icons.check_rounded.codePoint),
                      style: TextStyle(
                        inherit: false,
                        color: AppColors.black,
                        fontSize: 70.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: Icons.check_rounded.fontFamily,
                        package: Icons.check_rounded.fontPackage,
                      ),
                    )),
                VerticalSpacing(26.h),
                Text(
                  'Congratulations',
                  style:
                      Fonts.noto(context, AppColors.black, 26, FontWeight.w700),
                ),
                VerticalSpacing(20.h),
                Text(
                  'You have subscribed Premium Plan Yearly Package.',
                  textAlign: TextAlign.center,
                  style: Fonts.noto(
                      context, AppColors.raisinBlack, 16, FontWeight.w400),
                ),
                VerticalSpacing(26.h),
                isCategory
                    ? ButtonComponent(
                        height: 40.h,
                        onPressed: () {
                          Get.to(() => const BLooMBottomNavigation());
                        },
                        buttonText: 'View Categories',
                        width: double.nan,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ));
  }
}
