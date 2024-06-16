import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/components/screen_loader_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views_models/onboard/edit_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditBioView extends StatelessWidget with BLooMBackroundMixin {
  const EditBioView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileViewModel>(
        init: EditProfileViewModel(),
        builder: (controller) {
          return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: ScreenLoader(
                isLoading: controller.isLoading,
                child: Container(
                  decoration: bLooMGradient(),
                  child: Scaffold(
                    appBar: const AppBarComponent(
                      title: 'Profile',
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldComponent(
                            labelText: "Name",
                            isLabelRequired: true,
                            currentFocus: controller.nameFocus,
                            nextFocus: controller.aboutFocus,
                            controller: controller.nameController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            enableSuggestions: true,
                          ),
                          Stack(
                            children: [
                              TextFieldComponent(
                                labelText: "About",
                                isLabelRequired: true,
                                currentFocus: controller.aboutFocus,
                                controller: controller.aboutController,
                                maxLength: controller.maxlenth,
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
                        ],
                      ).paddingSymmetric(horizontal: 16.w),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    floatingActionButton: ButtonComponent(
                      onPressed: () {
                        Get.back();
                      },
                      buttonText: 'Save Changes',
                      height: 48.h,
                    ).paddingSymmetric(horizontal: 16.w),
                  ),
                ),
              ));
        });
  }
}
