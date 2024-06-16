import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views_models/onboard/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget with BLooMBackroundMixin {
  SplashView({super.key});

  final SplashViewModel viewmodel = Get.put(SplashViewModel());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        viewmodel.routePage();
      },
      child: Scaffold(
        body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: width,
            decoration: bLooMGradient(),
            child: Container(
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          AppImages.splashCover,
                        ))),
                child: SizedBox(
                  height: height * 0.2,
                  width: width * 0.2,
                  child: Image.asset(
                    AppImages.logo,
                  ).paddingAll(120.r),
                ))),
      ),
    );
  }
}
