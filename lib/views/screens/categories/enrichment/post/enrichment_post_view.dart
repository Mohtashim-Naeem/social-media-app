import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:bloom_app/views/screens/categories/enrichment/video/enrichment_video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnrichmentPostView extends StatelessWidget with BLooMBackroundMixin {
  const EnrichmentPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    splashColor: AppColors.black,
                    borderRadius: BorderRadius.circular(50),
                    child: CircleAvatar(
                      radius: 34.r,
                      backgroundColor: Colors.white.withOpacity(0.60),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ).marginOnly(top: 50)),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const EnrichmentVideoPlayerView());
                  },
                  child: Container(
                    height: 376.h,
                    decoration: BoxDecoration(
                        // color: AppColors.black,
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/Enrichment.png',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(24.r))),
                    child: Center(
                      child: CircleAvatar(
                          backgroundColor:
                              AppColors.raisinBlack.withOpacity(0.81),
                          radius: 25.r,
                          child: Icon(
                            Icons.play_arrow,
                            size: 35.h,
                            color: AppColors.white,
                          )),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Finding Inner Peace',
                      style: Fonts.noto(
                          context, AppColors.black, 18, FontWeight.w700),
                    ),
                    VerticalSpacing(5.h),
                    Text(
                      'In this soul nurturing sermon, speaker John A. Doe guides gently listeners on a journey to discover inner peace mind life’s chaos.',
                      style: Fonts.noto(
                          context, AppColors.black, 12, FontWeight.w400),
                    ),
                    VerticalSpacing(11.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          child: const Icon(Icons.person),
                        ),
                        HorizontalSpacing(9.w),
                        Text(
                          'Youtube Channel Name',
                          style: Fonts.noto(
                              context, AppColors.black, 10, FontWeight.w500),
                        )
                      ],
                    ),
                    VerticalSpacing(12.h),
                    Text(
                      'Jan 15, 2024 - 1hr 14min',
                      style: Fonts.noto(
                          context, AppColors.raisinBlack, 10, FontWeight.w500),
                    ),
                    VerticalSpacing(22.h),
                    const PostActionComponent(
                        totalComments: '20', totalLikes: '10'),
                  ],
                ).paddingOnly(top: 12.h, left: 16.w, right: 16.w)
              ],
            ),
          ),
        ));
  }
}
