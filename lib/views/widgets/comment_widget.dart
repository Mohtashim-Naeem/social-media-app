import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentTileWidget extends StatelessWidget {
  const CommentTileWidget({
    super.key,
    this.isReply = false,
  });
  final bool isReply;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 7.w,
      minVerticalPadding: 9.3.h,
      contentPadding: !isReply
          ? isReply
              ? EdgeInsets.only(bottom: 16.h)
              : EdgeInsets.zero
          : EdgeInsets.only(left: 33.w, bottom: 16.h),
      leading: CircleAvatar(
        radius: !isReply ? 16.r : 12.r,
        child: Icon(
          Icons.person,
          size: !isReply ? 16.h : 12.h,
        ),
      ),
      title: Row(
        children: [
          Text(
            'Danial Deo',
            style: !isReply
                ? Fonts.noto(context, AppColors.black, 12, FontWeight.w600)
                : Fonts.noto(context, AppColors.black, 10, FontWeight.w600),
          ),
          HorizontalSpacing(4.w),
          Text(
            '05m',
            style: !isReply
                ? Fonts.noto(
                    context, AppColors.grayniteGray, 10, FontWeight.w400)
                : Fonts.noto(
                    context, AppColors.grayniteGray, 8, FontWeight.w400),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inspiring reflection!',
            style: !isReply
                ? Fonts.noto(context, AppColors.black, 12, FontWeight.w400)
                : Fonts.noto(context, AppColors.black, 10, FontWeight.w400),
          ),
          VerticalSpacing(6.h),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: AppColors.black,
                      size: 14.h,
                    ),
                    HorizontalSpacing(5.w),
                    Text(
                      'Like',
                      style: Fonts.noto(
                        context,
                        AppColors.black,
                        12,
                        FontWeight.w500,
                      ),
                    ),
                    HorizontalSpacing(23.w),
                    Text('Reply',
                        style: Fonts.noto(
                          context,
                          AppColors.black,
                          12,
                          FontWeight.w500,
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      isThreeLine: true,
    );
  }
}
