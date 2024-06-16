import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/constants/strings/strings.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views_models/onboard/onboard_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardView extends StatelessWidget with BLooMBackroundMixin {
  OnBoardView({super.key});
  // final OnBoardViewmodel viewmodel = Get.put(OnBoardViewmodel());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder(
          init: OnBoardViewmodel(),
          builder: (viewmodel) {
            return GestureDetector(
              onTap: () {
                viewmodel.onGestureDetect();
              },
              child: Scaffold(
                body: Center(
                    child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutQuad,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: viewmodel.isExpanded ? viewmodel.height : 0.0,
                  alignment: viewmodel.isExpanded
                      ? Alignment.center
                      : Alignment.bottomRight,
                  width: viewmodel.isExpanded
                      ? MediaQuery.sizeOf(context).width
                      : 0.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.sonicSilver,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        VerticalSpacing(68.h),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.magentaPink,
                                AppColors.magicMint,
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(1.5.r),
                          margin: EdgeInsets.all(3.r),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.sonicSilver,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(15.r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(AppImages.onBoard),
                            ),
                          ),
                        ),
                        VerticalSpacing(31.h),
                        Text(
                          AppStrings.onBoardTitle,
                          style: Fonts.caveatBrush(
                              context, AppColors.black, 22, FontWeight.w400),
                        ),
                        VerticalSpacing(30.h),
                        Text(
                          AppStrings.onBoardGreeting,
                          textAlign: TextAlign.center,
                          style: Fonts.noto(
                              context, AppColors.granite, 14, FontWeight.w400),
                        ),
                        const VerticalSpacing(20),
                      ],
                    ).paddingSymmetric(
                      horizontal: 16.w,
                    ),
                  ),
                )),
              ),
            );
          }),
    );
  }
}
