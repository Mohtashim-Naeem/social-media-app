import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookPostWidget extends StatelessWidget {
  const BookPostWidget(
      {super.key,
      required this.data,
      this.commentOnTap,
      this.likeOnTap,
      this.onTap});
  final BookPostData data;
  final void Function()? commentOnTap;
  final void Function()? likeOnTap;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
        width: double.infinity,
        color: AppColors.cardColor.withOpacity(0.31),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: SizedBox(
                // width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        data.image,
                        fit: BoxFit.cover,
                        color: AppColors.raisinBlack.withOpacity(0.50),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 16.w, right: 16.w, bottom: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.date,
                            style: Fonts.noto(
                                context, AppColors.white, 10, FontWeight.w400),
                          ),
                          Text(
                            'By ${data.publisherName}',
                            style: Fonts.noto(
                                context, AppColors.white, 12, FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    !data.isExpand
                        ? Positioned(
                            bottom: 16.h,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                left: 16.w,
                                right: 16.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.bookName,
                                    style: Fonts.noto(context, AppColors.white,
                                        14, FontWeight.w600),
                                  ),
                                  VerticalSpacing(6.h),
                                  Text(
                                    data.bookDetails,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: Fonts.noto(context, AppColors.white,
                                        12, FontWeight.w400),
                                  ),
                                  Text(
                                    '\$${data.bookPrice}',
                                    style: Fonts.noto(context, AppColors.white,
                                        14, FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            PostActionComponent(
              totalComments: data.totalComments,
              totalLikes: data.totalLikes,
              isLiked: data.isLike,
              commentOnTap: commentOnTap,
              likeOnTap: likeOnTap,
            ),
            const Divider(
              color: AppColors.magentaPink,
            ),
            !data.isExpand ? VerticalSpacing(10.h) : VerticalSpacing(17.h),
            !data.isExpand
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.bookName,
                            style: Fonts.noto(
                                context, AppColors.black, 16, FontWeight.w600),
                          ),
                          Text(
                            '\$${data.bookPrice}',
                            style: Fonts.noto(
                                context, AppColors.black, 16, FontWeight.w600),
                          )
                        ],
                      ),
                      VerticalSpacing(12.h),
                      Text(
                        data.bookDetails,
                        style: Fonts.noto(
                            context, AppColors.black, 12, FontWeight.w400),
                      )
                    ],
                  ),
          ],
        )).marginOnly(bottom: 8.h);
  }
}

class BookPostData {
  String image;
  String publisherName;
  String bookName;
  String date;
  String bookDetails;
  String bookPrice;
  String totalComments;
  String totalLikes;
  bool isLike;
  bool isExpand;

  BookPostData(
      {required this.image,
      required this.publisherName,
      required this.bookDetails,
      required this.totalComments,
      required this.totalLikes,
      required this.date,
      required this.bookName,
      required this.bookPrice,
      required this.isLike,
      this.isExpand = false});
}
