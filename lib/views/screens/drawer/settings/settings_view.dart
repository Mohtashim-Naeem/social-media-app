import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/dialog_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget with BLooMBackroundMixin {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
          appBar: const AppBarComponent(
            title: 'Settings',
          ),
          body: SingleChildScrollView(
            child: Column(
                children: List.generate(
              Utils.settingIcons.length,
              (index) {
                return InkWell(
                  onTap: () {
                    // Get.to(() => Utils.settingIconsDestinations[index]);
                    index != 4
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Utils.settingIconsDestinations[index],
                            ),
                          )
                        : Get.dialog(
                            DialogComponent(
                              title: 'Delete Account',
                              subTitle:
                                  'Are you sure you want to delete your account?',
                              onYes: () async {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Utils.settingIconsDestinations[index],
                                  ),
                                );
                              },
                            ),
                          );
                  },
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.cardColor.withOpacity(0.31),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Utils.settingIcons[index],
                            height: 24.h,
                            width: 24.w,
                          ),
                          HorizontalSpacing(12.w),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Utils.settingTitles[index],
                                  style: Fonts.noto(context, AppColors.black,
                                      12, FontWeight.w600),
                                ),
                                VerticalSpacing(8.h),
                                Text(
                                  Utils.settingDesc[index],
                                  style: Fonts.noto(context, AppColors.black,
                                      12, FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              },
            )).paddingSymmetric(horizontal: 16.w),
          ),
        ));
  }
}
