import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/screens/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBarWidget(
      {super.key, required this.name, required this.profile});
  final String name;
  final String profile;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return AppBar(
      toolbarHeight: height * 0.06,
      backgroundColor: AppColors.magentaPink,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleSpacing: 0,
      title: InkWell(
        onTap: () => Get.offAll(() => const BLooMBottomNavigation()),
        borderRadius: BorderRadius.circular(50),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundColor: AppColors.white,
              backgroundImage: const AssetImage(AppImages.onBoard),
            ),
            const HorizontalSpacing(10),
            Flexible(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Fonts.noto(
                    context, AppColors.white, 16.sp, FontWeight.w600),
              ),
            ),
            const HorizontalSpacing(10),
            Image.asset(
              profile,
              height: 38.h,
              width: 38.w,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity,
      Utils.isTablet(Get.context!) ? Get.height * 0.10 : Get.height * 0.06);
}
