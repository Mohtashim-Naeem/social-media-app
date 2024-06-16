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
import 'package:google_fonts/google_fonts.dart';

class CommunityRulesView extends StatelessWidget with BLooMBackroundMixin {
  const CommunityRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationSettingViewModel(),
        builder: (controller) {
          return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                appBar: const AppBarComponent(
                  title: 'Cummunity Rules',
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpacing(12.h),
                        Text(
                          'Welcome to our community! We believe in fostering a safe, inclusive, and supportive environment for all our users. Our community guidelines are designed to ensure that everyone can enjoy their experience to the fullest while respecting the rights and well-being of others. Please take a moment to familiarize yourself with our rules and expectations outlined below. Together, we can BLooM!',
                          style: Fonts.noto(
                              context, AppColors.black, 12, FontWeight.w400),
                        ),
                        VerticalSpacing(18.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1.',
                              style: Fonts.noto(context, AppColors.black, 12,
                                  FontWeight.w400),
                            ),
                            HorizontalSpacing(8.w),
                            Expanded(
                                child: RichText(
                                    text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'Healthy disagreements can be expected in a community of diverse people with diverse opinions and perspectives. However, let’s keep in mind Ephesians 4:29,',
                                  style: Fonts.noto(context, AppColors.black,
                                      12, FontWeight.w400)),
                              TextSpan(
                                text:
                                    '“Do not let any unwholesome talk come out of your mouths, but only what is helpful for building others up according to their needs, that it may benefit those who listen.”',
                                // style: Fonts.noto(context, AppColors.black, 12,
                                //     FontWeight.w700),
                                style: GoogleFonts.notoSans(
                                  color: AppColors.black,
                                  decoration: TextDecoration.underline,
                                  fontSize: Utils.isTablet(context)
                                      ? 12 >= 20
                                          ? 24
                                          : 18
                                      : 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      'Be respectful to your fellow Bloomers!',
                                  style: Fonts.noto(context, AppColors.black,
                                      12, FontWeight.w400)),
                            ]))),
                          ],
                        ),
                        VerticalSpacing(16.h),
                        ...List.generate(
                          _normalTextParagrah.length,
                          (index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 2}',
                                style: Fonts.noto(context, AppColors.black, 12,
                                    FontWeight.w400),
                              ),
                              HorizontalSpacing(8.w),
                              Expanded(
                                  child: RichText(
                                      text: TextSpan(children: [
                                TextSpan(
                                  text: _normalTextParagrah[index],
                                  // style: Fonts.noto(context, AppColors.black,
                                  //     12, FontWeight.w700),
                                  style: GoogleFonts.notoSans(
                                    color: AppColors.black,
                                    decoration: TextDecoration.underline,
                                    fontSize: Utils.isTablet(context)
                                        ? 12 >= 20
                                            ? 24
                                            : 18
                                        : 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: _boldTextParagrah[index],
                                  style: Fonts.noto(context, AppColors.black,
                                      12, FontWeight.w400),
                                ),
                              ]))),
                            ],
                          ).paddingOnly(bottom: 16.h),
                        )
                      ]).paddingSymmetric(horizontal: 16.w),
                ),
              ));
        });
  }
}

List _normalTextParagrah = [
  '“But the fruit of the spirit is love, joy, peace, forbearance, kindness, goodness, faithfulness, gentleness, and self-control.',
  '“They triumphed over him by the blood of the Lamb and by the word of their testimony”',
  '“When there are many words, sin is unavoidable, but the one who controls his lips is prudent.”',
];
List _boldTextParagrah = [
  ' -Galatians 5:22 ALL are welcome here! However, internet bullies and keyboard gangsters will be removed quietly and promptly. Bullying, hate speech, or any form of volatile behavior will not be tolerated. Be kind to your fellow Bloomers!',
  ' -Revelation 12:11 Feel free to share all testimonies and revelations in the comment section. We love to hear them! Nonetheless, keep all advertisements, promotions, spam, and scams to yourself. Be considerate of your fellow Bloomers!',
  ' -Proverbs 10:19\nThough enjoying your fellow Bloomers is encouraged, sharing personal information, I.e., phone numbers, addresses, financial details, etc., is ill-advised. Maintain privacy. Enjoy, but be wise!',
];
