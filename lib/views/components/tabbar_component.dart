import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent(
      {super.key, required this.firstTab, required this.secondTab});
  final String firstTab;
  final String secondTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: MediaQuery.of(context).size.width,
      child: SegmentedTabControl(
        backgroundColor: AppColors.lightMagentaPink,
        radius: Radius.circular(50.r),
        indicatorColor: AppColors.magicMint,
        squeezeIntensity: 2,
        height: 40.h,
        tabPadding: EdgeInsets.symmetric(horizontal: 8.w),
        textStyle:
            Fonts.noto(context, AppColors.raisinBlack, 12, FontWeight.w400),
        selectedTextStyle:
            Fonts.noto(context, AppColors.raisinBlack, 12, FontWeight.w700),
        tabs: [
          SegmentTab(
            label: firstTab,
            textColor: AppColors.black,
            selectedTextColor: AppColors.black,
          ),
          SegmentTab(
            label: secondTab,
            textColor: AppColors.raisinBlack,
            selectedTextColor: AppColors.raisinBlack,
          )
        ],
      ),
    );
  }
}
