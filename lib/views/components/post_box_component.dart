import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:bloom_app/views/screens/image/image_view.dart';
import 'package:bloom_app/views/screens/video/video_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum PostType { text, image, video, event }

class PostBoxComponent extends StatelessWidget {
  const PostBoxComponent({super.key, required this.postData});
  final PostData postData;
  @override
  Widget build(BuildContext context) {
    return getType(postData.types, context, postData);
  }
}

Widget getType(PostType type, BuildContext context, PostData postData) {
  switch (type) {
    case PostType.text:
      return textPost(context, postData);

    case PostType.image:
      return imagePost(context, postData);

    case PostType.video:
      return videoPost(context, postData);

    case PostType.event:
      return eventPost(context, postData);

    default:
      return textPost(context, postData);
  }
}

Widget textPost(BuildContext context, PostData data) {
  return Container(
      // height: 162.h,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      width: double.infinity,
      color: AppColors.lightMagentaPink.withOpacity(0.31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Admin',
                style: Fonts.noto(
                    context, AppColors.deepFuchsiaPink, 16, FontWeight.w500),
              ),
              HorizontalSpacing(6.w),
              Text(
                data.postTime,
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 12, FontWeight.w500),
              )
            ],
          ),
          VerticalSpacing(12.h),
          Text(
            data.title,
            style: Fonts.noto(context, AppColors.black, 14, FontWeight.w600),
          ),
          VerticalSpacing(4.h),
          Text(
            data.desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Fonts.noto(context, AppColors.black, 12, FontWeight.w400),
          ),
          VerticalSpacing(9.h),
          PostActionComponent(
            totalComments: data.totalComments,
            totalLikes: data.totalLikes,
            isLiked: data.isLiked,
            commentOnTap: data.commentOnTap,
            likeOnTap: data.likeOnTap,
          ),
          const Divider(
            color: AppColors.magentaPink,
          ),
          VerticalSpacing(10.h)
        ],
      ));
}

Widget imagePost(BuildContext context, PostData data) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      width: double.infinity,
      color: AppColors.lightMagentaPink.withOpacity(0.31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Admin',
                style: Fonts.noto(
                    context, AppColors.deepFuchsiaPink, 16, FontWeight.w500),
              ),
              HorizontalSpacing(6.w),
              Text(
                data.postTime,
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 12, FontWeight.w500),
              )
            ],
          ),
          VerticalSpacing(12.h),
          // Text(
          //   data.desc,
          //   style: Fonts.noto(context, AppColors.black, 12, FontWeight.w400),
          // ),
          // VerticalSpacing(9.h),
          // Image.asset(data.postImage),
          InkWell(
            onTap: () {
              Get.to(() => ImageView(image: data.postImage));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                width: double.infinity,
                imageUrl: data.postImage,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          VerticalSpacing(8.h),

          PostActionComponent(
            totalComments: data.totalComments,
            totalLikes: data.totalLikes,
            isLiked: data.isLiked,
            commentOnTap: data.commentOnTap,
            likeOnTap: data.likeOnTap,
          ),
          const Divider(
            color: AppColors.magentaPink,
          ),
          VerticalSpacing(10.h)
        ],
      ));
}

Widget videoPost(BuildContext context, PostData data) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      width: double.infinity,
      color: AppColors.lightMagentaPink.withOpacity(0.31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Admin',
                style: Fonts.noto(
                    context, AppColors.deepFuchsiaPink, 16, FontWeight.w500),
              ),
              HorizontalSpacing(6.w),
              Text(
                data.postTime,
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 12, FontWeight.w500),
              )
            ],
          ),
          VerticalSpacing(12.h),
          Text(
            data.desc,
            style: Fonts.noto(context, AppColors.black, 12, FontWeight.w400),
          ),
          VerticalSpacing(15.h),
          InkWell(
            onTap: () {
              Get.to(() => const VideoView());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Image.asset(data.thumnail),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    imageUrl: data.thumnail,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                CircleAvatar(
                    backgroundColor: AppColors.raisinBlack.withOpacity(0.81),
                    radius: 25.r,
                    child: Icon(
                      Icons.play_arrow,
                      size: 24.h,
                      color: AppColors.white,
                    )),
              ],
            ),
          ),
          VerticalSpacing(8.h),
          PostActionComponent(
            totalComments: data.totalComments,
            totalLikes: data.totalLikes,
            isLiked: data.isLiked,
            commentOnTap: data.commentOnTap,
            likeOnTap: data.likeOnTap,
          ),
          const Divider(
            color: AppColors.magentaPink,
          ),
          VerticalSpacing(10.h)
        ],
      ));
}

Widget eventPost(BuildContext context, PostData data) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      width: double.infinity,
      color: AppColors.lightMagentaPink.withOpacity(0.31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Admin',
                style: Fonts.noto(
                    context, AppColors.deepFuchsiaPink, 16, FontWeight.w500),
              ),
              HorizontalSpacing(6.w),
              Text(
                data.postTime,
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 12, FontWeight.w500),
              )
            ],
          ),
          VerticalSpacing(12.h),
          // Image.asset(data.postImage),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              imageUrl: data.postImage,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          VerticalSpacing(8.h),
          Text(
            data.eventDateTime,
            style: Fonts.noto(context, AppColors.black, 12, FontWeight.w400),
          ),
          Text(
            data.eventTitle,
            style: Fonts.noto(context, AppColors.black, 14, FontWeight.w700),
          ),
          Text(
            data.eventLocation,
            style: Fonts.noto(
                context, AppColors.grayniteGray, 12, FontWeight.w500),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${data.totalInterests}  ',
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 10, FontWeight.w700)),
            TextSpan(
                text: 'interested',
                style: Fonts.noto(
                    context, AppColors.grayniteGray, 10, FontWeight.w400))
          ])),
          VerticalSpacing(16.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 38.h,
                width: 280.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.magentaPink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_purple500_sharp,
                      size: 20.h,
                      color: AppColors.white,
                    ),
                    HorizontalSpacing(4.w),
                    Text(
                      'Interested',
                      style: Fonts.noto(
                          context, AppColors.white, 14, FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 13.w),
                  height: 38.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.magentaPink,
                  ),
                  child: const Icon(
                      CupertinoIcons.arrowshape_turn_up_right_fill,
                      color: AppColors.white))
            ],
          )
        ],
      ));
}

class PostData {
  final String postTime;
  final String title;
  final String desc;
  final String totalComments;
  final String totalLikes;
  final String postImage;
  final String thumnail;
  final String eventDateTime;
  final String eventTitle;
  final String eventLocation;
  final String totalInterests;
  final PostType types;
  final void Function()? likeOnTap;
  final void Function()? commentOnTap;
  final bool isLiked;
  PostData({
    this.likeOnTap,
    this.commentOnTap,
    this.isLiked = false,
    required this.postTime,
    required this.title,
    required this.desc,
    required this.totalComments,
    required this.totalLikes,
    required this.postImage,
    required this.thumnail,
    required this.eventDateTime,
    required this.eventTitle,
    required this.eventLocation,
    required this.totalInterests,
    required this.types,
  });
}
