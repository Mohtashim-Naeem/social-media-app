import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views/components/video_tile_component.dart';
import 'package:bloom_app/views/screens/categories/brittany/post/brittany_post_view.dart';
import 'package:bloom_app/views_models/brittany/brittany_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BrittanyTalksView extends StatelessWidget with BLooMBackroundMixin {
  const BrittanyTalksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder(
          init: BrittanyTalkViewModel(),
          builder: (controller) {
            return Scaffold(
                appBar: const AppBarComponent(
                  isFlowerAppBar: true,
                  flowerImage: AppImages.brittanyFlower,
                  title: 'Brittany Talks',
                ),
                body: Column(
                  children: [
                    TextFieldComponent(
                      currentFocus: controller.searchFocus,
                      controller: controller.searchController,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AppVectors.searchIcon,
                        ),
                      ),
                    ),
                    VerticalSpacing(16.h),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => VideoTileComponent(
                              onTap: () {
                                Get.to(() => const BrittanyPostView());
                              },
                              image: 'assets/images/video-image.png',
                              title: 'Finding Clarity in Life Chaos',
                              desc:
                                  'Join Brittany in this insightful talk as she explores  ways to find...',
                              videoInfo: 'Jan 15, 2024 - 1hr 14min'),
                        ),
                      ),
                    ))
                  ],
                ).paddingSymmetric(horizontal: 16.w));
          }),
    );
  }
}
