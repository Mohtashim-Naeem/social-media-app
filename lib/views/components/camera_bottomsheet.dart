import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({
    super.key,
    required this.controller,
    required this.isUploaded,
  });
  final dynamic controller;
  final bool isUploaded;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //To Perform Picture upload Action

        Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13.r),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // VerticalSpacing(10.h),
                // Container(
                //   height: 5,
                //   width: 40,
                //   decoration: BoxDecoration(
                //       color: AppColors.gray,
                //       borderRadius: BorderRadius.circular(20)),
                // ),
                GestureDetector(
                  onTap: () {
                    controller.getImage(
                      ImageSource.gallery,
                    );
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60.h,
                    child: Text(
                      'Upload image',
                      style: Fonts.poppins(
                          context, AppColors.black, 20, FontWeight.w400),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5.h,
                  endIndent: 0,
                  indent: 0,
                  color: AppColors.black,
                ),
                GestureDetector(
                  onTap: () {
                    controller.getImage(
                      ImageSource.camera,
                    );
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60.h,
                    child: Text(
                      'Take photo',
                      style: Fonts.poppins(
                          context, AppColors.black, 20, FontWeight.w400),
                    ),
                  ),
                ),

                isUploaded
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(
                            thickness: 0.5.h,
                            endIndent: 0,
                            indent: 0,
                            color: AppColors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.deleteImage();
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              child: Text(
                                'Remove',
                                style: Fonts.poppins(context,
                                    AppColors.errorRed, 20, FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            )),
        //To Cancel Action
        VerticalSpacing(5.h),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13.r),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60.h,
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: Fonts.poppins(
                          context, AppColors.black, 20, FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      ],
    ).marginSymmetric(horizontal: 10.w);
  }
}
