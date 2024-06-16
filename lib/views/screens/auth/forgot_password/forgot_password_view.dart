import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/auth/forgot_password/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget with BLooMBackroundMixin {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
          decoration: bLooMGradient(),
          child: GetBuilder(
              init: ForgotPasswordViewModel(),
              builder: (controller) {
                return Scaffold(
                    appBar: const AppBarComponent(),
                    body: Column(
                      children: [
                        Image.asset(
                          height: 120,
                          width: 120,
                          AppImages.logo,
                        ),
                        VerticalSpacing(10.h),
                        Text(
                          'Lost your password? No worries. Enter your email below, and we’ll send you a verification code to reset your password securely.',
                          textAlign: TextAlign.center,
                          style: Fonts.noto(
                              context, AppColors.black, 15, FontWeight.w400),
                        ),
                        VerticalSpacing(47.h),
                        TextFieldComponent(
                          controller: controller.emailController,
                          currentFocus: controller.emailFocus,
                          isLabelRequired: true,
                          labelText: 'Email',
                          hintText: 'Email',
                          validator: Utils.validateEmail,
                          onChanged: (_) {
                            controller.checkValidation();
                          },
                        ),
                        const Spacer(),
                        ButtonComponent(
                            isLoading: controller.isLoading,
                            isDisable: controller.isDisable,
                            onPressed: controller.verifyForgotEmail,
                            buttonText: 'Next'),
                        const VerticalSpacing()
                      ],
                    ).paddingSymmetric(horizontal: 16.h));
              })),
    );
  }
}
