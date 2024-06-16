import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/screen_loader_component.dart';
import 'package:bloom_app/views_models/payment_method/payment_method_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentMethodView extends StatelessWidget with BLooMBackroundMixin {
  const PaymentMethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodViewModel>(
        init: PaymentMethodViewModel(),
        builder: (controller) {
          return ScreenLoader(
              isLoading: controller.isLoading,
              child: Container(
                  decoration: bLooMGradient(),
                  child: Scaffold(
                    appBar: const AppBarComponent(
                      title: 'Payment Method',
                    ),
                    body: Column(
                      children: [
                        ListTile(
                          onTap: controller.payment,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          tileColor: AppColors.white,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppVectors.appleIcon),
                              HorizontalSpacing(3.w),
                              Text(
                                'Pay',
                                style: Fonts.noto(context, AppColors.black, 18,
                                    FontWeight.w500),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 18.h,
                          ),
                        ).marginSymmetric(horizontal: 16.w, vertical: 16.h),
                        ListTile(
                          onTap: controller.payment,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          tileColor: AppColors.white,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppVectors.googleIcon),
                              HorizontalSpacing(3.w),
                              Text(
                                'Pay',
                                style: Fonts.noto(
                                    context,
                                    AppColors.grayniteGray,
                                    18,
                                    FontWeight.w500),
                              ),
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 18.h,
                          ),
                        ).marginSymmetric(horizontal: 16.w),
                      ],
                    ),
                  )));
        });
  }
}
