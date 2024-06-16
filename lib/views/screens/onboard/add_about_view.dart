import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/strings/strings.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/screen_loader_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/onboard/edit_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddAboutView extends StatelessWidget with BLooMBackroundMixin {
  const AddAboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditProfileViewModel(),
        builder: (controller) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ScreenLoader(
              isLoading: false,
              child: Container(
                decoration: bLooMGradient(),
                child: Scaffold(
                  appBar: const AppBarComponent(
                    title: 'About',
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                  ),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.aboutGreet,
                          style: Fonts.noto(
                              context, AppColors.black, 12, FontWeight.w400),
                        ),
                        VerticalSpacing(35.h),
                        Text(
                          'Tell us about yourself',
                          style: Fonts.noto(
                              context, AppColors.black, 16, FontWeight.w500),
                        ),
                        VerticalSpacing(10.6.h),
                        Stack(
                          children: [
                            TextFieldComponent(
                              currentFocus: controller.aboutFocus,
                              controller: controller.aboutController,
                              maxLength: 300,
                              maxLines: 10,
                              minLines: 7,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              enableSuggestions: true,
                              onChanged: controller.onAboutChanges,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text(
                                  '${controller.aboutController.value.text.length}/${controller.maxlenth}'),
                            ),
                          ],
                        ),
                        const VerticalSpacing(200),
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: ButtonComponent(
                    onPressed: () {
                      controller.save();
                    },
                    buttonText: 'Save',
                    height: 48.h,
                  ).paddingSymmetric(horizontal: 16.w),
                ),
              ),
            ),
          );
        });
  }
}
