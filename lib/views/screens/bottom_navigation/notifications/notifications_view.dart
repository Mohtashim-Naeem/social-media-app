import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget with BLooMBackroundMixin {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(

        //   body:
        SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: Fonts.noto(context, AppColors.black, 12, FontWeight.w500),
          ),
          VerticalSpacing(16.h),
          ...List.generate(
              4,
              (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 11.w,
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: const CachedNetworkImageProvider(
                          'https://images.unsplash.com/photo-1562690868-60bbe7293e94?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHJvc2V8ZW58MHx8MHx8fDA%3D'),
                    ),
                    title: Text(
                      'Start you day with inspiration. A new daily devotion is ready for you. Dive...',
                      maxLines: 2,
                      style: Fonts.noto(
                          context, AppColors.raisinBlack, 12, FontWeight.w400),
                    ),
                    trailing: Text(
                      '9:47 PM',
                      maxLines: 2,
                      style: Fonts.noto(
                          context, AppColors.raisinBlack, 12, FontWeight.w400),
                    ),
                  ).paddingOnly(bottom: 16.h)),
          Text(
            'Over the Last 30 Days',
            style: Fonts.noto(context, AppColors.black, 12, FontWeight.w500),
          ),
          VerticalSpacing(16.h),
          ...List.generate(
              13,
              (index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 11.w,
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: const CachedNetworkImageProvider(
                          'https://images.unsplash.com/photo-1562690868-60bbe7293e94?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHJvc2V8ZW58MHx8MHx8fDA%3D'),
                    ),
                    title: Text(
                      'Start you day with inspiration. A new daily devotion is ready for you. Dive...',
                      maxLines: 2,
                      style: Fonts.noto(
                          context, AppColors.raisinBlack, 12, FontWeight.w400),
                    ),
                    trailing: Text(
                      '9:47 PM',
                      maxLines: 2,
                      style: Fonts.noto(
                          context, AppColors.raisinBlack, 12, FontWeight.w400),
                    ),
                  ).paddingOnly(bottom: 16.h))
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
    // );
  }
}
