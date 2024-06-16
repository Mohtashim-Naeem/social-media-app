import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views_models/settings/notifications_settings_view_model/notifications_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationSettingsView extends StatelessWidget
    with BLooMBackroundMixin {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationSettingViewModel(),
        builder: (controller) {
          return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                appBar: const AppBarComponent(
                  title: 'Notifications',
                ),
                body: Column(
                    children: List.generate(
                  Utils.notificationSettingTitles.length,
                  (index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Utils.notificationSettingTitles[index],
                                style: Fonts.noto(context, AppColors.black, 12,
                                    FontWeight.w600),
                              ),
                              VerticalSpacing(8.h),
                              Text(
                                Utils.notificationSettingDesc[index],
                                style: Fonts.noto(context, AppColors.black, 12,
                                    FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        HorizontalSpacing(12.w),
                        Switch.adaptive(
                          activeColor: AppColors.white,
                          inactiveThumbColor: AppColors.magentaPink,
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          activeTrackColor: AppColors.magentaPink,
                          value: controller.notificationState[index],
                          onChanged: (value) {
                            controller.setStateNotification(value, index);
                          },
                        ),
                      ],
                    ).paddingOnly(bottom: 24.h);
                  },
                )).paddingSymmetric(horizontal: 16.w),
              ));
        });
  }
}
