import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/screens/comments/comments_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostActionComponent extends StatelessWidget {
  const PostActionComponent(
      {super.key,
      this.likeOnTap,
      this.commentOnTap,
      required this.totalComments,
      required this.totalLikes,
      this.isLiked = false,
      this.isWhite = false});
  final void Function()? likeOnTap;
  final void Function()? commentOnTap;
  final String totalComments;
  final String totalLikes;
  final bool isLiked;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: likeOnTap,
          child: Row(
            children: [
              Icon(
                isLiked
                    ? Icons.thumb_up_alt_rounded
                    : Icons.thumb_up_alt_outlined,
                color: isWhite ? AppColors.white : AppColors.black,
              ),
              HorizontalSpacing(5.w),
              Text(
                'Like',
                style: Fonts.noto(
                  context,
                  isWhite ? AppColors.white : AppColors.black,
                  12,
                  FontWeight.w400,
                ),
              )
            ],
          ).paddingAll(6),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Get.to(() => const CommentsView());
          },
          child: Text(
            '$totalComments Comments',
            style: Fonts.noto(
              context,
              isWhite ? AppColors.white : AppColors.black,
              12,
              FontWeight.w400,
            ),
          ).paddingAll(6),
        ),
        HorizontalSpacing(16.w),
        Text(
          '$totalLikes likes',
          style: Fonts.noto(
            context,
            isWhite ? AppColors.white : AppColors.black,
            12,
            FontWeight.w400,
          ),
        )
      ],
    );
  }
}
