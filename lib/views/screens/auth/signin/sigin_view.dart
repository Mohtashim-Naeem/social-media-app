import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views/screens/auth/forgot_password/forgot_password_view.dart';
import 'package:bloom_app/views/screens/auth/signup/sign_up_view.dart';
import 'package:bloom_app/views/widgets/richtext_component.dart';
import 'package:bloom_app/views/widgets/social_login_button.dart';
import 'package:bloom_app/views_models/auth/signin/signin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget with BLooMBackroundMixin {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetBuilder(
          init: SignInViewModel(),
          builder: (controller) {
            return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        VerticalSpacing(108.h),
                        Text(
                          'Welcome to BLooM!',
                          style: Fonts.caveatBrush(context,
                              AppColors.raisinBlack, 36, FontWeight.w400),
                        ),
                        VerticalSpacing(38.h),
                        TextFieldComponent(
                          controller: controller.emailController,
                          currentFocus: controller.emailFocus,
                          nextFocus: controller.passFocus,
                          isLabelRequired: true,
                          labelText: 'Email',
                          hintText: 'Email',
                          validator: Utils.validateEmail,
                        ).paddingSymmetric(vertical: 24.h),
                        TextFieldComponent(
                          controller: controller.passController,
                          currentFocus: controller.passFocus,
                          isLabelRequired: true,
                          labelText: 'Password',
                          hintText: 'Password',
                          obscureText: controller.isPassEye,
                          validator: Utils.validatePassword,
                          suffixIcon: IconButton(
                              onPressed: controller.changePassObsecure,
                              icon: Icon(
                                controller.isPassEye
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.lightGrey,
                              )),
                        ),
                        VerticalSpacing(6.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ForgotPassword());
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: Fonts.noto(context, AppColors.raisinBlack,
                                  12, FontWeight.w400),
                            ),
                          ),
                        ),
                        VerticalSpacing(24.h),
                        ButtonComponent(
                            height: 48.h,
                            isLoading: controller.isLoading,
                            onPressed: controller.signIn,
                            buttonText: 'Log In'),
                        VerticalSpacing(8.h),
                        Center(
                          child: RichTextComponent(
                            firstText: 'Don’t have an account? ',
                            secondText: 'Create one',
                            onTap: () {
                              Get.to(() => const SignUpView());
                            },
                          ),
                        ),
                        VerticalSpacing(38.h),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                              endIndent: 10,
                              color: AppColors.magentaPink.withOpacity(0.30),
                            )),
                            Text(
                              'Or',
                              style: Fonts.noto(context, AppColors.raisinBlack,
                                  16, FontWeight.w400),
                            ),
                            Expanded(
                                child: Divider(
                              indent: 10,
                              thickness: 1,
                              color: AppColors.magentaPink.withOpacity(0.30),
                            )),
                          ],
                        ).paddingSymmetric(vertical: 24.h),
                        SocialLoginButton(
                            onPressed: () {},
                            buttonText: 'Continue with Google',
                            vector: AppVectors.googleIcon),
                        SocialLoginButton(
                                onPressed: () {},
                                buttonText: 'Continue with Facebook',
                                vector: AppVectors.facebookIcon)
                            .paddingSymmetric(vertical: 16.h),
                        SocialLoginButton(
                            onPressed: () {},
                            buttonText: 'Continue with Apple',
                            vector: AppVectors.appleIcon),
                        VerticalSpacing(24.h)
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
