import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GreetingView extends StatelessWidget with BLooMBackroundMixin {
  const GreetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
          appBar: const AppBarComponent(
            title: 'Hey You!',
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  // height: 167.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor.withOpacity(0.31),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About BLooM',
                        style: Fonts.noto(
                            context, AppColors.black, 14, FontWeight.w600),
                      ),
                      VerticalSpacing(8.h),
                      Text(
                        'Welcome to BLooM! Your sanctuary for spiritual connection and growth. Dive into daily devotions, prayers, and uplifting content. Join our vibrant community, share, and find inspiration on your journey. Your presence enriches us. Let\'s bloom together!',
                        style: Fonts.noto(
                            context, AppColors.black, 13, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(16.h),
                Container(
                  // height: 263.h,
                  width: double.infinity,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.raisinBlack.withOpacity(0.51),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      AppImages.heartImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                VerticalSpacing(16.h),
                Container(
                  // height: 167.h,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                      color: AppColors.cardColor.withOpacity(0.31),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quote',
                        style: Fonts.noto(
                            context, AppColors.black, 14, FontWeight.w600),
                      ),
                      VerticalSpacing(8.h),
                      Text(
                        '“Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work.”',
                        style: Fonts.noto(
                            context, AppColors.black, 13, FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        ));
  }
}
