import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/screens/categories/brittany_playlist/music_actions.dart';
import 'package:bloom_app/views/screens/categories/brittany_playlist/player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BrittanyPlalistViewModel extends GetxController {
  Rx<double> flexibleSpaceMaxHeight = 300.0.obs;
  bool smartScroll(notification) {
    if (notification is ScrollUpdateNotification) {
      // Decrease the flexible space height based on the scroll position
      flexibleSpaceMaxHeight.value -= notification.scrollDelta!;
      // Ensure the minimum height is not less than a certain value
      flexibleSpaceMaxHeight.value =
          flexibleSpaceMaxHeight.value.clamp(100.0, 300.0);
      // update();
    }
    return true;
  }
}

class BrittanyPlalistView extends StatelessWidget with BLooMBackroundMixin {
  const BrittanyPlalistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: Scaffold(
        appBar: const AppBarComponent(
          isFlowerAppBar: true,
          flowerImage: AppImages.brittanyPlaylistFlower,
          title: "Super Boost",
        ),
        body: GetBuilder(
            init: BrittanyPlalistViewModel(),
            builder: (controller) {
              return NotificationListener(
                onNotification: controller.smartScroll,
                child: CustomScrollView(
                  slivers: [
                    Obx(
                      () => SliverAppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        centerTitle: false,
                        automaticallyImplyLeading: false,
                        expandedHeight: controller.flexibleSpaceMaxHeight.value,
                        flexibleSpace: AnimatedContainer(
                          height: controller.flexibleSpaceMaxHeight.value,
                          duration: const Duration(seconds: 0),
                          child: Image.asset(
                            'assets/images/music-header.png',
                          ),
                        ),
                        //  FlexibleSpaceBar(
                        //   collapseMode: CollapseMode.none,
                        //   background: Image.asset(
                        //     'assets/images/music-header.png',
                        //     // fit: BoxFit.cover,
                        //   ),
                        // ),
                      ),
                    ),
                    SliverAppBar.medium(
                        elevation: 0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        pinned: true,
                        // bottom: PreferredSize(
                        //     preferredSize: const Size.fromHeight(-10),
                        // child: Divider(
                        //   thickness: 1,
                        //   indent: 16,
                        //   endIndent: 16,
                        //   color: AppColors.magentaPink.withOpacity(0.30),
                        // )),
                        expandedHeight: Utils.isTablet(context) ? 100.h : 120.h,
                        scrolledUnderElevation: 0.0,
                        leadingWidth: double.infinity,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // const CircleAvatar(
                            //   radius: 26,
                            //   backgroundColor: ,
                            //   child: Icon(
                            //     Icons.play_arrow_rounded,
                            //     size: 35,
                            //   ),
                            // ),
                            GetBuilder(
                                init: MusicPlayerViewModel(),
                                builder: (controller) {
                                  return Controls(
                                    audioPlayer: controller.player,
                                    isLeftRight: false,
                                    // playPauseColor: Color(0xffD0E7EA),
                                  );
                                }),
                            const HorizontalSpacing(12),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.magicMint,
                              child: SvgPicture.asset(
                                AppVectors.loopIcon,
                              ),
                            ),
                            HorizontalSpacing(16.w),
                          ],
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpacing(10.h),
                              Text(
                                "Soft, relaxing music for recovery.",
                                // textAlign: TextAlign.start,
                                style: Fonts.noto(
                                  context,
                                  AppColors.black,
                                  12,
                                  FontWeight.w500,
                                ),
                              ),
                              VerticalSpacing(4.h),
                              Text(
                                "1hr 14min",
                                // textAlign: TextAlign.start,
                                style: Fonts.noto(
                                  context,
                                  AppColors.grayniteGray,
                                  10,
                                  FontWeight.w500,
                                ),
                              ),
                              VerticalSpacing(14.h),
                              Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12.r),
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        // const Icon(
                                        //   Icons.thumb_up_alt_outlined,
                                        //   color: AppColors.black,
                                        // ),
                                        SvgPicture.asset(
                                          AppVectors.likeIcon,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.black, BlendMode.srcIn),
                                        ),
                                        HorizontalSpacing(5.w),
                                        Text(
                                          'Like',
                                          style: Fonts.noto(
                                            context,
                                            AppColors.black,
                                            12,
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  HorizontalSpacing(18.w),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12.r),
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppVectors.chatIcon,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.black, BlendMode.srcIn),
                                        ),
                                        HorizontalSpacing(5.w),
                                        Text(
                                          'Like',
                                          style: Fonts.noto(
                                            context,
                                            AppColors.black,
                                            12,
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: AppColors.magentaPink.withOpacity(0.30),
                              )
                            ],
                          ).paddingSymmetric(horizontal: 16.w),
                        )),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => ListTile(
                                onTap: () async {
                                  Get.to(() => const MusicPlayerView());
                                  // final player = AudioPlayer(); // Create a player
                                  // final duration = await player.setUrl(// Load a URL
                                  //     'https://hayatpr.000webhostapp.com/Cheap%20Thrills%20-%20Sia%20Karaoke%20%E3%80%90With%20Guide%20Melody%E3%80%91%20Instrumental.mp3'); // Schemes: (https: | file: | asset: )
                                  // player.play();
                                },
                                splashColor: AppColors.magicMint,
                                leading: Container(
                                  height: 48.h,
                                  width: 48.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(AppImages.adioLeading),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.raisinBlack
                                          .withOpacity(0.81),
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        size: 15.h,
                                        color: AppColors.white,
                                      )),
                                ),
                                title: Text(
                                  'Ed Sheeran',
                                  style: Fonts.noto(
                                    context,
                                    AppColors.black,
                                    12,
                                    FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  'Artist',
                                  style: Fonts.noto(
                                    context,
                                    AppColors.black,
                                    12,
                                    FontWeight.w400,
                                  ),
                                ),
                              ),
                          childCount: 20),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
