import 'dart:io';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views_models/onboard/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final CreateProfileViemModel vm = CreateProfileViemModel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => InkWell(
              borderRadius: BorderRadius.circular(20.r),
              onTap: () {
                Utils.openBottomSheet(vm, vm.isUploaded.value);
              },
              child: Stack(
                children: [
                  vm.selectImagePath.value.isEmpty
                      ? Container(
                          height: 172.h,
                          width: 172.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppImages.onBoard),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          height: 172.h,
                          width: 172.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(
                                    File(vm.selectImagePath.value),
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                  Positioned(
                    bottom: 3,
                    right: Utils.isTablet(context) ? 40.w : 15.w,
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: const BoxDecoration(
                          color: AppColors.white, shape: BoxShape.circle),
                      child: Center(
                          child: Transform.flip(
                              flipX: true,
                              child: Text(
                                String.fromCharCode(
                                    Icons.add_a_photo_outlined.codePoint),
                                style: TextStyle(
                                  inherit: false,
                                  color: AppColors.magentaPink,
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily:
                                      Icons.add_a_photo_outlined.fontFamily,
                                  package:
                                      Icons.add_a_photo_outlined.fontPackage,
                                ),
                              ))),
                    ),
                  )
                ],
              ),
            ),
          ),
          VerticalSpacing(54.h),
          ListTile(
            title: Text(
              "Name",
              style: Fonts.noto(
                  context, AppColors.raisinBlack, 12, FontWeight.w400),
            ),
            subtitle: Text(
              "Danial Mason",
              style: Fonts.noto(
                  context, AppColors.raisinBlack, 16, FontWeight.w500),
            ),
            leading: SvgPicture.asset(
              AppVectors.personIcon,
            ),
          ),
          Divider(
            color: AppColors.magentaPink.withOpacity(0.30),
            indent: 35,
            endIndent: 35,
            thickness: 1.h,
          ),
          ListTile(
            title: Text("About",
                style: Fonts.noto(
                    context, AppColors.raisinBlack, 12, FontWeight.w400)),
            subtitle: Text("Lorem ipsum dolor sit amet consectetur....",
                style: Fonts.noto(
                    context, AppColors.raisinBlack, 12, FontWeight.w400)),
            leading: SvgPicture.asset(AppVectors.infoIcon),
          ),
          Divider(
            color: AppColors.magentaPink.withOpacity(0.30),
            indent: 35,
            endIndent: 35,
            thickness: 1.h,
          ),
          ListTile(
            title: Text("Email",
                style: Fonts.noto(
                    context, AppColors.raisinBlack, 12, FontWeight.w400)),
            subtitle: Text("sarah.mason@gmail.com",
                style: Fonts.noto(
                    context, AppColors.raisinBlack, 12, FontWeight.w400)),
            leading: SvgPicture.asset(AppVectors.mailIcon),
          ),
        ],
      ),
    );
  }
}
