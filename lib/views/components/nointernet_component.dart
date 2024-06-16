import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetSheet extends StatelessWidget {
  const NoInternetSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 40.h,
            color: AppColors.errorRed,
          ),
          VerticalSpacing(10.h),
          Text(
            'Lost Connection',
            style: Fonts.noto(context, AppColors.black, 16, FontWeight.w700),
          ),
          VerticalSpacing(10.h),
          Text(
            'NO Internet found\nCheck your Connection',
            textAlign: TextAlign.center,
            style: Fonts.noto(
                context, AppColors.grayniteGray, 14, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
