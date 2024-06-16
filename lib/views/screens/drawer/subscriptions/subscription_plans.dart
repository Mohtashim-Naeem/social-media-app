import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/dialog_component.dart';
import 'package:bloom_app/views/components/info_rich_text_component.dart';
import 'package:bloom_app/views/components/tabbar_component.dart';
import 'package:bloom_app/views/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bloom_app/views/screens/payment_method/payment_method_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SubscriptionPlansView extends StatelessWidget with BLooMBackroundMixin {
  SubscriptionPlansView({super.key});
  Map<String, bool> payment = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            appBar: const AppBarComponent(
              title: 'Subscription Plans',
            ),
            body: Column(
              children: [
                const TabBarComponent(firstTab: 'Monthly', secondTab: 'Yearly'),
                Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          VerticalSpacing(40.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            // height: 497.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.subscriptionPlans),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                payment['payment']!
                                    ? Column(
                                        children: [
                                          VerticalSpacing(26.h),
                                          Center(
                                            child: Text(
                                              'Current Plan',
                                              style: Fonts.poppins(
                                                  context,
                                                  AppColors.black,
                                                  16,
                                                  FontWeight.w600),
                                            ),
                                          ),
                                          VerticalSpacing(20.h),
                                        ],
                                      )
                                    : VerticalSpacing(30.h),
                                Text(
                                  'Premium Plan',
                                  style: Fonts.poppins(context, AppColors.black,
                                      16, FontWeight.w600),
                                ),
                                VerticalSpacing(12.h),
                                Row(
                                  children: [
                                    Text(
                                      '\$',
                                      style: Fonts.poppins(context,
                                          AppColors.black, 13, FontWeight.w400),
                                    ),
                                    Expanded(
                                        child: InfoRichTextComponent(
                                      firstText: '8.99',
                                      firstStyle: Fonts.poppins(context,
                                          AppColors.black, 32, FontWeight.w500),
                                      secondText: '/month',
                                      secondStyle: Fonts.poppins(context,
                                          AppColors.black, 11, FontWeight.w400),
                                    ))
                                  ],
                                ).marginOnly(bottom: 8.h),
                                VerticalSpacing(20.h),
                                Text(
                                  'Includes:',
                                  style: Fonts.poppins(context, AppColors.black,
                                      14, FontWeight.w500),
                                ),
                                VerticalSpacing(16.h),
                                ...List.generate(
                                    premiumLabels.length,
                                    (index) => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor:
                                                  AppColors.magentaPink,
                                              child: Icon(
                                                Icons.check,
                                                color: AppColors.white,
                                                size: 11.h,
                                              ),
                                            ),
                                            HorizontalSpacing(16.w),
                                            Expanded(
                                              child: InfoRichTextComponent(
                                                  firstText:
                                                      premiumLabels[index],
                                                  firstTextColor:
                                                      AppColors.raisinBlack,
                                                  secondTextColor:
                                                      AppColors.raisinBlack,
                                                  secondText:
                                                      premiumDetails[index]),
                                            )
                                          ],
                                        ).marginOnly(bottom: 8.h)),
                                // const Spacer(),
                                VerticalSpacing(70.h),
                                ButtonComponent(
                                        onPressed: () {
                                          payment['payment']!
                                              ? Get.dialog(
                                                  DialogComponent(
                                                    title:
                                                        'Cancel Subscription',
                                                    subTitle:
                                                        'Are you sure you want to cancel your subcription?',
                                                    onYes: () {
                                                      Get.offAll(() =>
                                                          const BLooMBottomNavigation());
                                                    },
                                                  ),
                                                )
                                              : Get.to(
                                                  () =>
                                                      const PaymentMethodView(),
                                                  arguments:
                                                      payment['payment']!);
                                        },
                                        buttonText: payment['payment']!
                                            ? 'Cancel Plan'
                                            : 'Subscribe Now')
                                    .marginOnly(bottom: 16.h)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          VerticalSpacing(40.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            // height: 497.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.subscriptionPlans),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VerticalSpacing(30.h),
                                Text(
                                  'Premium Plan',
                                  style: Fonts.poppins(context, AppColors.black,
                                      16, FontWeight.w600),
                                ),
                                VerticalSpacing(12.h),
                                Row(
                                  children: [
                                    Text(
                                      '\$',
                                      style: Fonts.poppins(context,
                                          AppColors.black, 13, FontWeight.w400),
                                    ),
                                    Expanded(
                                        child: InfoRichTextComponent(
                                      firstText: '75.00',
                                      firstStyle: Fonts.poppins(context,
                                          AppColors.black, 32, FontWeight.w500),
                                      secondText: '/Year',
                                      secondStyle: Fonts.poppins(context,
                                          AppColors.black, 11, FontWeight.w400),
                                    )),
                                    Text(
                                      '30% OFF',
                                      style: Fonts.poppins(
                                          context,
                                          AppColors.darkMagentaPink,
                                          20,
                                          FontWeight.w600),
                                    ),
                                  ],
                                ).marginOnly(bottom: 8.h),
                                VerticalSpacing(20.h),
                                Text(
                                  'Includes:',
                                  style: Fonts.poppins(context, AppColors.black,
                                      14, FontWeight.w500),
                                ),
                                VerticalSpacing(16.h),
                                ...List.generate(
                                    premiumLabels.length,
                                    (index) => Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 8.r,
                                              backgroundColor:
                                                  AppColors.magentaPink,
                                              child: Icon(
                                                Icons.check,
                                                color: AppColors.white,
                                                size: 11.h,
                                              ),
                                            ),
                                            HorizontalSpacing(16.w),
                                            Expanded(
                                                child: InfoRichTextComponent(
                                                    firstText:
                                                        premiumLabels[index],
                                                    firstTextColor:
                                                        AppColors.raisinBlack,
                                                    secondTextColor:
                                                        AppColors.raisinBlack,
                                                    secondText:
                                                        premiumDetails[index]))
                                          ],
                                        ).marginOnly(bottom: 8.h)),
                                // const Spacer(),
                                VerticalSpacing(70.h),

                                ButtonComponent(
                                        onPressed: () {
                                          Get.to(
                                              () => const PaymentMethodView(),
                                              arguments: payment['payment']!);
                                        },
                                        buttonText: 'Subscribe Now')
                                    .marginOnly(bottom: 16.h)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}

var premiumLabels = [
  'Brittany Talks – ',
  'Brittany’s Playlist – ',
  'Blooming – ',
  'Books of the Month – ',
  'Enrichment – ',
];
var premiumDetails = [
  'An overflow of revelations, chats with friends, bloomers, guest takeovers, and more!',
  'Start the week with a good playlist!',
  'Keep up with Bloomers!',
  'Suggested Good Reads!',
  'Shared sermons, podcasts, and inspirational talks!',
];
