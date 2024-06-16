import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeepWatchingTileComponent extends StatelessWidget {
  const KeepWatchingTileComponent(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      required this.desc,
      required this.videoInfo,
      this.isPlaylist = false});
  final void Function()? onTap;
  final String image;
  final String title;
  final String desc;
  final String videoInfo;
  final bool isPlaylist;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 56.h,
            width: 51.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover)),
            child: Visibility(
              visible: !isPlaylist,
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
          ),
          HorizontalSpacing(9.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Fonts.noto(
                      context,
                      isPlaylist ? AppColors.white : AppColors.black,
                      12,
                      FontWeight.w600),
                ),
                Text(
                  desc,
                  style: Fonts.noto(
                      context,
                      isPlaylist ? AppColors.white : AppColors.black,
                      12,
                      FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                VerticalSpacing(8.h),
                Text(
                  videoInfo,
                  style: Fonts.noto(
                      context, AppColors.grayniteGray, 10, FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
