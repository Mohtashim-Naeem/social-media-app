import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/settings/delete_acc/delete_acc_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteAccountView extends StatelessWidget with BLooMBackroundMixin {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
          decoration: bLooMGradient(),
          child: GetBuilder(
              init: DeleteAccountViewModel(),
              builder: (controller) {
                return Scaffold(
                    appBar: const AppBarComponent(
                      title: 'Delete Account',
                    ),
                    body: Column(
                      children: [
                        VerticalSpacing(12.h),
                        TextFieldComponent(
                          controller: controller.passController,
                          currentFocus: controller.passFocus,
                          isLabelRequired: true,
                          labelText: 'Enter Password',
                          hintText: 'Enter Password',
                          validator: Utils.validatePassword,
                          onChanged: (_) {
                            controller.checkValidation();
                          },
                          obscureText: controller.isPassEye,
                          suffixIcon: IconButton(
                              onPressed: controller.changePassObsecure,
                              icon: Icon(
                                controller.isPassEye
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.lightGrey,
                              )),
                        ),
                        const Spacer(),
                        ButtonComponent(
                            isLoading: controller.isLoading,
                            isDisable: controller.isDisable,
                            onPressed: () {
                              Get.bottomSheet(Container(
                                height: 326.h,
                                width: double.infinity,
                                decoration: bLooMGradient(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.r))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    VerticalSpacing(10.h),
                                    Container(
                                      height: 3.h,
                                      width: 40.w,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    VerticalSpacing(50.h),
                                    // const Spacer(),
                                    CircleAvatar(
                                        radius: 42.5.r,
                                        backgroundColor: AppColors.magicMint,
                                        child: Text(
                                          String.fromCharCode(
                                              Icons.check_rounded.codePoint),
                                          style: TextStyle(
                                            inherit: false,
                                            color: AppColors.black,
                                            fontSize: 70.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                Icons.check_rounded.fontFamily,
                                            package:
                                                Icons.check_rounded.fontPackage,
                                          ),
                                        )),
                                    VerticalSpacing(28.h),
                                    Text(
                                      'Account Deleted',
                                      style: Fonts.noto(context,
                                          AppColors.black, 24, FontWeight.w500),
                                    ),
                                    VerticalSpacing(92.h),

                                    // const Spacer(),
                                  ],
                                ),
                              ));
                            },
                            buttonText: 'Delete Account'),
                        const VerticalSpacing()
                      ],
                    ).paddingSymmetric(horizontal: 16.h));
              })),
    );
  }
}
