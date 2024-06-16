import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/screen_loader_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/auth/reset_password/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget with BLooMBackroundMixin {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetBuilder(
        init: ResetPasswordViewModel(),
        builder: (controller) {
          return ScreenLoader(
            isLoading: controller.isLoading,
            child: Scaffold(
              appBar: const AppBarComponent(),
              extendBodyBehindAppBar: true,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 115.h),
                  decoration: bLooMGradient(),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.88,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Change Password',
                            style: Fonts.caveatBrush(
                                context, AppColors.black, 24, FontWeight.w400),
                          ),
                          VerticalSpacing(15.h),
                          Text(
                            'Choose a new password to ensure the security\nof your account.',
                            textAlign: TextAlign.center,
                            style: Fonts.noto(context, AppColors.raisinBlack,
                                12, FontWeight.w400),
                          ),
                          VerticalSpacing(34.h),
                          TextFieldComponent(
                            controller: controller.passController,
                            currentFocus: controller.passFocus,
                            nextFocus: controller.confirmPassFocus,
                            isLabelRequired: true,
                            labelText: 'New Password',
                            hintText: 'Enter new Password',
                            obscureText: controller.isPassEye,
                            validator: Utils.validatePassword,
                            onChanged: (_) {
                              controller.checkValidation();
                            },
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
                              hintText: 'Confirm new Password',
                              obscureText: controller.isConfirmPassEye,
                              onChanged: (_) {
                                controller.checkValidation();
                              },
                              suffixIcon: IconButton(
                                  onPressed:
                                      controller.changeConfirmPassObsecure,
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
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ButtonComponent(
                                onPressed: controller.resetPassword,
                                isDisable: controller.isDisable,
                                buttonText: "Save",
                                // isLoading: controller.isLoading,
                                height: 48.h,
                              ),
                            ),
                          ),
                          const VerticalSpacing()
                        ],
                      ).paddingSymmetric(horizontal: 16.w),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
