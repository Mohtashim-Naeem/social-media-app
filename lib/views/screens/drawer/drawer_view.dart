import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawerView extends StatelessWidget with BLooMBackroundMixin {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32.r))),
      child: Drawer(
        width: Utils.isTablet(context) ? 158.w : 238.w,
        // width: 253.w,
        backgroundColor: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            height: 167.h,
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: SvgPicture.asset(
                AppVectors.appLogo,
              ),
            ),
          ),
          Divider(
            color: AppColors.magentaPink.withOpacity(0.80),
            endIndent: 15.w,
            indent: 17.w,
          ),
          VerticalSpacing(16.h),
          ...List.generate(
            Utils.drawerIcons.length,
            (index) => InkWell(
              splashColor: AppColors.lightMagentaPink,
              onTap: () {
                if (index == 4) {
                  Get.offAll(const SignInView());
                } else {
                  Get.to(() => Utils.drawerDestinations[index],
                      arguments: {'payment': true});
                }
              },
              child: SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Utils.drawerIcons[index],
                      height: 20.h,
                      width: 20.w,
                    ),
                    HorizontalSpacing(14.w),
                    Text(
                      Utils.drawerTitles[index],
                      style: Fonts.noto(
                          context, AppColors.black, 12, FontWeight.w500),
                    ),
                  ],
                ),
              ).paddingOnly(left: 17.w),
            ),
          )
        ]).paddingOnly(top: 30),
      ),
    );
  }
}
