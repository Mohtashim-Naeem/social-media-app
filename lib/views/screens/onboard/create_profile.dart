import 'dart:io';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/button_component.dart';
import 'package:bloom_app/views/screens/onboard/add_about_view.dart';
import 'package:bloom_app/views/widgets/dotted_borde.dart';
import 'package:bloom_app/views_models/onboard/create_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadProfilePicView extends StatelessWidget with BLooMBackroundMixin {
  const UploadProfilePicView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CreateProfileViemModel(),
        builder: (controller) {
          return Container(
              decoration: bLooMGradient(),
              child: Scaffold(
                  appBar: const AppBarComponent(
                    title: "Upload Photo",
                    centerTitle: true,
                  ),
                  body: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: Column(
                        children: [
                          VerticalSpacing(60.h),
                          Obx(
                            () => InkWell(
                              borderRadius: BorderRadius.circular(20.r),
                              onTap: () {
                                Utils.openBottomSheet(
                                    controller, controller.isUploaded.value);
                              },
                              child: Stack(
                                children: [
                                  controller.selectImagePath.value.isEmpty
                                      ? CustomPaint(
                                          foregroundPainter:
                                              DottedBorderPainter(),
                                          child: Container(
                                            height: 172.h,
                                            width: 172.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffEFEFEF),
                                            ),
                                            child: const Icon(
                                              CupertinoIcons.person,
                                              size: 60,
                                              color: AppColors.magentaPink,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 172.h,
                                          width: 172.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    File(controller
                                                        .selectImagePath.value),
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                  Positioned(
                                    bottom: 3,
                                    right: 15,
                                    child: Container(
                                      height: 38,
                                      width: 38,
                                      decoration: const BoxDecoration(
                                          color: AppColors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Icon(
                                        controller.selectImagePath.value.isEmpty
                                            ? Icons.add_rounded
                                            : Icons.add_a_photo_outlined,
                                        size: 25,
                                        color: AppColors.magentaPink,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          ButtonComponent(
                              isLoading: false,
                              isDisable: false,
                              onPressed: () {
                                Get.to(() => const AddAboutView(),
                                    transition: Transition.rightToLeft);
                              },
                              buttonText: 'Next'),
                          const VerticalSpacing()
                        ],
                      )).paddingSymmetric(horizontal: 16.h)));
        });
  }
}
