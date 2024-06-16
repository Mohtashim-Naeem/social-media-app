import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyDevoTileWidget extends StatelessWidget {
  const DailyDevoTileWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.desc,
      required this.image,
      this.onTap});
  final String title;
  final String date;
  final String desc;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.cardColor.withOpacity(0.31),
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  image,
                  height: 100.h,
                  width: 101.w,
                  fit: BoxFit.cover,
                ),
              ),
              HorizontalSpacing(7.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Fonts.noto(
                              context, AppColors.black, 14, FontWeight.w700),
                        ),
                        Text(
                          date,
                          style: Fonts.noto(
                              context, AppColors.black, 10, FontWeight.w700),
                        ),
                      ],
                    ),
                    VerticalSpacing(8.h),
                    Text(
                      desc,
                      style: Fonts.noto(
                          context, AppColors.lightergray, 12, FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
