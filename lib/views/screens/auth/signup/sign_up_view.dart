import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views/screens/auth/signin/sigin_view.dart';
import 'package:bloom_app/views/widgets/richtext_component.dart';
import 'package:bloom_app/views/widgets/social_login_button.dart';
import 'package:bloom_app/views_models/auth/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget with BLooMBackroundMixin {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetBuilder(
          init: SignUpViewModel(),
          builder: (controller) {
            return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                appBar: const AppBarComponent(),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create an account',
                        style: Fonts.caveatBrush(
                            context, AppColors.black, 36, FontWeight.w400),
                      ),
                      VerticalSpacing(42.h),
                      TextFieldComponent(
                        controller: controller.nameController,
                        currentFocus: controller.nameFocus,
                        nextFocus: controller.emailFocus,
                        isLabelRequired: true,
                        labelText: 'Full Name',
                        hintText: 'Full Name',
                        validator: Utils.validateName,
                      ),
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
                        nextFocus: controller.confirmPassFocus,
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
                      VerticalSpacing(24.h),
                      TextFieldComponent(
                          controller: controller.confirmPassController,
                          currentFocus: controller.confirmPassFocus,
                          isLabelRequired: true,
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          obscureText: controller.isConfirmPassEye,
                          suffixIcon: IconButton(
                              onPressed: controller.changeConfirmPassObsecure,
                              icon: Icon(
                                controller.isConfirmPassEye
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.lightGrey,
                              )),
                          validator: (p0) {
                            return Utils.confirmValidatePassword(
                                controller.passController.text,
                                controller.confirmPassController.text);
                          }),
                      VerticalSpacing(42.h),
                      ButtonComponent(
                          height: 48.h,
                          isLoading: controller.isLoading,
                          onPressed: controller.signUp,
                          buttonText: 'Sign Up'),
                      VerticalSpacing(8.h),
                      Center(
                        child: RichTextComponent(
                          firstText: 'Already have an account? ',
                          secondText: 'Login here',
                          onTap: () {
                            Get.offAll(() => const SignInView());
                          },
                        ),
                      ),
                      VerticalSpacing(24.h),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'By registering, you accept our ',
                                style: Fonts.noto(context, AppColors.midGrey,
                                    12, FontWeight.w400)),
                            TextSpan(
                                text: 'Terms & conditions',
                                style: Fonts.noto(context, AppColors.darkGreen,
                                    12, FontWeight.w700)),
                            TextSpan(
                                text: ' & ',
                                style: Fonts.noto(context, AppColors.midGrey,
                                    12, FontWeight.w400)),
                            TextSpan(
                                text: 'Privacy policy',
                                style: Fonts.noto(context, AppColors.darkGreen,
                                    12, FontWeight.w700))
                          ])),
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
            );
          }),
    );
  }
}
