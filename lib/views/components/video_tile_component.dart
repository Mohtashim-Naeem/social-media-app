import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoTileComponent extends StatelessWidget {
  const VideoTileComponent({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.desc,
    required this.videoInfo,
  });
  final void Function()? onTap;
  final String image;
  final String title;
  final String desc;
  final String videoInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 102,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
            color: AppColors.cardColor.withOpacity(0.31),
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Container(
              height: 86.h,
              width: 96.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Center(
                child: CircleAvatar(
                    backgroundColor: AppColors.raisinBlack.withOpacity(0.81),
                    radius: 10.r,
                    child: Icon(
                      Icons.play_arrow,
                      size: 13.h,
                      color: AppColors.white,
                    )),
              ),
            ),
            HorizontalSpacing(9.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Fonts.noto(
                        context, AppColors.black, 14, FontWeight.w600),
                  ),
                  Text(
                    desc,
                    style: Fonts.noto(
                        context, AppColors.black, 12, FontWeight.w400),
                  ),
                  VerticalSpacing(8.h),
                  Text(
                    videoInfo,
                    style: Fonts.noto(
                        context, AppColors.grayniteGray, 10, FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
