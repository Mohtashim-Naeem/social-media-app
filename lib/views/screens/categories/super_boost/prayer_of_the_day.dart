import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerOfTheDayView extends StatelessWidget with BLooMBackroundMixin {
  const PrayerOfTheDayView(
      {super.key,
      required this.title,
      required this.image,
      required this.description});
  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: Scaffold(
        appBar: const AppBarComponent(
          title: "Prayer of the Day",
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardColor.withOpacity(0.31),
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            margin: EdgeInsets.only(
              bottom: 16.w,
            ),
            child: Column(
              children: [
                VerticalSpacing(16.h),
                Text(
                  title, //"Morning Blessing",
                  textAlign: TextAlign.center,
                  style: Fonts.noto(
                    context,
                    AppColors.raisinBlack,
                    16,
                    FontWeight.w700,
                  ),
                ),
                VerticalSpacing(14.h),
                Container(
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.raisinBlack.withOpacity(0.0),
                        AppColors.raisinBlack.withOpacity(0.48),
                        AppColors.raisinBlack.withOpacity(0.50),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      //    AppImages.superBoostDummy,
                    ),
                  ),
                ),
                VerticalSpacing(16.h),
                Text(
                  description, // "May this day overflow with joy and positivity, brings smiles and warmth to every moment. Embrace growth, gratitude, and kindness. Wishing you a day filled with laughter, love and inspiration.",
                  textAlign: TextAlign.start,
                  style: Fonts.noto(
                    context,
                    AppColors.black,
                    16,
                    FontWeight.w500,
                  ),
                ),
                VerticalSpacing(16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
