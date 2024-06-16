import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/widgets/see_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuperBoostCardWidget extends StatelessWidget {
  const SuperBoostCardWidget(
      {super.key,
      required this.title,
      required this.subTiltle,
      required this.group,
      required this.date,
      required this.image,
      this.onTap});
  final String title;
  final String group;
  final String subTiltle;
  final String date;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return group == 'Prayer of the Week'
        ? InkWell(
            onTap: onTap,
            child: Container(
              height: 198.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomLeft,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // begin: Alignment(0.00, -1.00),
                    // end: Alignment(0, 1),
                    colors: [
                      AppColors.raisinBlack.withOpacity(0.0),
                      AppColors.raisinBlack.withOpacity(0.48),
                      AppColors.raisinBlack.withOpacity(0.50),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      date,
                      style: Fonts.noto(
                          context, AppColors.white, 10, FontWeight.w700),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: Fonts.noto(
                          context, AppColors.white, 14, FontWeight.w600),
                    ),
                    VerticalSpacing(6.h),
                    SeeMoreTextComponent(
                      subTitle: subTiltle + subTiltle,
                    ),
                  ],
                ).paddingOnly(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: InkWell(
              onTap: onTap,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.raisinBlack.withOpacity(0.0),
                          AppColors.raisinBlack.withOpacity(0.50),
                        ],
                      ),
                    ),
                    child: Image.asset(
                      fit: BoxFit.fitWidth,
                      image, //   'assets/images/super-boost-pic.png',
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Fonts.noto(
                            context, AppColors.white, 14, FontWeight.w600),
                      ),
                      VerticalSpacing(6.h),
                      SeeMoreTextComponent(
                        subTitle: subTiltle,
                        maxLines: 4,
                      ),
                    ],
                  ).paddingAll(16),
                ],
              ),
            ),
          ).marginSymmetric(horizontal: 16.w, vertical: 10.h);
  }
}
