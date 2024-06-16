import 'package:bloom_app/views_models/video/video_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/components/post_action_component.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VideoViewModel(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text(
                'Video',
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
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // VerticalSpacing(73.h),
                    PodVideoPlayer(
                      controller: controller.controller,
                      // videoAspectRatio: 1 / 1,
                      // frameAspectRatio: 1 / 1,
                      podProgressBarConfig: const PodProgressBarConfig(
                          playingBarColor: AppColors.lightMagentaPink,
                          circleHandlerColor: AppColors.magentaPink),
                      alwaysShowProgressBar: false,
                    ),
                  ],
                ),
              ),
            ),
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
