import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostImageWidget extends StatelessWidget {
  const PostImageWidget(
      {super.key,
      this.postTime,
      this.title,
      this.desc,
      required this.totalComments,
      required this.totalLikes,
      required this.postImage,
      this.likeOnTap,
      this.commentOnTap,
      this.isLiked = false});
  final String? postTime;
  final String? title;
  final String? desc;
  final String totalComments;
  final String totalLikes;
  final String postImage;
  final void Function()? likeOnTap;
  final void Function()? commentOnTap;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        width: double.infinity,
        color: AppColors.cardColor.withOpacity(0.31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title != null
                ? Text(
                    title.toString(),
                    style: Fonts.noto(
                        context, AppColors.raisinBlack, 10, FontWeight.w700),
                  )
                : Text(
                    postTime.toString(),
                    style: Fonts.noto(
                        context, AppColors.grayniteGray, 10, FontWeight.w500),
                  ),
            VerticalSpacing(12.h),
            if (desc != null)
              Text(
                desc.toString(),
                style:
                    Fonts.noto(context, AppColors.black, 12, FontWeight.w400),
              ),
            if (desc != null) VerticalSpacing(9.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fitWidth,
                imageUrl: postImage,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            VerticalSpacing(8.h),
            PostActionComponent(
              totalComments: totalComments,
              totalLikes: totalLikes,
              isLiked: isLiked,
              commentOnTap: commentOnTap,
              likeOnTap: likeOnTap,
            ),
            const Divider(),
            VerticalSpacing(10.h)
          ],
        ));
  }
}
