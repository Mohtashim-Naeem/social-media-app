import 'package:bloom_app/views_models/brittany/video/brittany_video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:pod_player/pod_player.dart';

class BrittanyVideoPlayerView extends StatelessWidget {
  const BrittanyVideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BrittanyVideoPlayerViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Finding Clarity in Life Chaos',
                style:
                    Fonts.noto(context, AppColors.white, 13, FontWeight.w600),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  )),
            ),
            extendBodyBehindAppBar: true,
            body: Center(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // VerticalSpacing(73.h),
                  AspectRatio(
                      aspectRatio: 1 / 1,
                      child: PodVideoPlayer(
                        controller: controller.controller,
                        videoAspectRatio: 1 / 1,
                        frameAspectRatio: 1 / 1,
                        podProgressBarConfig: const PodProgressBarConfig(
                            playingBarColor: AppColors.lightMagentaPink,
                            circleHandlerColor: AppColors.magentaPink),
                        alwaysShowProgressBar: false,
                      )),
                ],
              ),
            )),
            floatingActionButton: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PostActionComponent(
                  totalComments: '20',
                  totalLikes: '10',
                  isWhite: true,
                ),
                Divider(
                  color: AppColors.white,
                )
              ],
            ).paddingSymmetric(horizontal: 16.w),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        });
  }
}
