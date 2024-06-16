import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views_models/settings/notifications_settings_view_model/notifications_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermAndConditionView extends StatelessWidget with BLooMBackroundMixin {
  const TermAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationSettingViewModel(),
        builder: (controller) {
          return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                appBar: const AppBarComponent(
                  title: 'Terms and Conditions',
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Updated at January 1st, 2024',
                          style: Fonts.noto(
                              context, AppColors.black, 14, FontWeight.w600),
                        ),
                        VerticalSpacing(12.h),
                        Text(
                          'General Terms',
                          style: Fonts.noto(
                              context, AppColors.black, 14, FontWeight.w600),
                        ),
                        VerticalSpacing(8.h),
                        Text(
                          '''By accessing and placing an order with BLooM, you confirm that you are in agreement with and bound by the terms of service contained in the Terms & Conditions outlined below. These terms apply to the entire mobile application and any email or other type of communication between you and BLooM.
                  
Under no circumstances shall BLooM team be liable for any direct, indirect, special, incidental or consequential damages, including, but not limited to, loss of data or profit, arising out of the use, or the inability to use, the materials on this site, even if BLooM team or an authorized representative has been advised of the possibility of such damages. If your use of materials from this site results in the need for servicing, repair or correction of equipment or data, you assume any costs thereof.
                  
BLooM will not be responsible for any outcome that may occur during the course of usage of our resources. We reserve the rights to change prices and revise the resources usage policy in any moment.''',
                          style: Fonts.noto(
                              context, AppColors.black, 12, FontWeight.w400),
                        ),
                        VerticalSpacing(12.h),
                        Text(
                          'License',
                          style: Fonts.noto(
                              context, AppColors.black, 14, FontWeight.w600),
                        ),
                        VerticalSpacing(8.h),
                        Text(
                          '''BLooM grants you a revocable, non-exclusive, non-transferable, limited license to download, install and use the app strictly in accordance with the terms of this Agreement.
                  
These Terms & Conditions are a contract between you and BLooM (referred to in these Terms & Conditions as "BLooM", "us", "we" or "our"), the provider of the BLooM mobile application and the services accessible from the BLooM mobile application (which are collectively referred to in these Terms & Conditions as the "BLooM Service").
                  
You are agreeing to be bound by these Terms & Conditions. If you do not agree to these Terms & Conditions, please do not use the BLooM Service. In these Terms & Conditions, "you" refers both to you as an individual and to the entity you represent. If you violate any of these Terms & Conditions, we reserve the right to cancel your account or block access to your account without notice.
                  ''',
                          style: Fonts.noto(
                              context, AppColors.black, 12, FontWeight.w400),
                        ),
                      ]).paddingSymmetric(horizontal: 16.w),
                ),
              ));
        });
  }
}
