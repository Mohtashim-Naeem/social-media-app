import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/settings/change_password/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget with BLooMBackroundMixin {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetBuilder(
        init: ChangePasswordViewModel(),
        builder: (controller) {
          return Container(
            decoration: bLooMGradient(),
            child: Scaffold(
              appBar: const AppBarComponent(
                title: 'Change Password',
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.88,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VerticalSpacing(12.h),
                      TextFieldComponent(
                        controller: controller.currentPassword,
                        currentFocus: controller.currentPasswordFocus,
                        nextFocus: controller.currentPasswordFocus,
                        isLabelRequired: true,
                        labelText: 'Current Password',
                        hintText: 'Enter Current Password',
                        obscureText: controller.isCurrentPassEye,
                        validator: Utils.validatePassword,
                        onChanged: (_) {
                          controller.checkValidation();
                        },
                        suffixIcon: IconButton(
                            onPressed: controller.currentPassObsecure,
                            icon: Icon(
                              controller.isCurrentPassEye
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.lightGrey,
                            )),
                      ),
                      VerticalSpacing(24.h),
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ButtonComponent(
                            onPressed: () {},
                            isDisable: controller.isDisable,
                            buttonText: "Update Password",
                            isLoading: controller.isLoading,
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
          );
        },
      ),
    );
  }
}
