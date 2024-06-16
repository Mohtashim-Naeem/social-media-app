import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views_models/blooming/blooming_view_model.dart';
import 'package:bloom_app/views_models/blooming/post/blooming_post_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class BloomingView extends StatelessWidget with BLooMBackroundMixin {
  const BloomingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder<BloomingViewModel>(
          init: BloomingViewModel(),
          builder: (controller) {
            return Scaffold(
              appBar: const AppBarComponent(
                isFlowerAppBar: true,
                flowerImage: AppImages.bloomingFlower,
                title: 'Blooming',
              ),
              body: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: controller.bloomingData.length,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 13.w,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => BloomingPostView(
                          image:
                              controller.bloomingData[index].image.toString()));
                    },
                    child: SizedBox(
                        child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                              imageUrl: controller.bloomingData[index].image
                                  .toString(),
                              placeholder: (context, url) => SizedBox(
                                  height: 310.h,
                                  width: 175.w,
                                  child: const Center(
                                      child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) => ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image.asset(
                                    AppImages.brittanyTalkCat,
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                                borderRadius: BorderRadius.circular(12.r),
                                onTap: () {
                                  controller.updateLikeStatus(index);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.bloomingData[index].isLike!
                                          ? Icons.thumb_up_alt_rounded
                                          : Icons.thumb_up_alt_outlined,
                                      color: AppColors.white,
                                      size: 20.h,
                                    ),
                                    HorizontalSpacing(5.w),
                                    Text(
                                      'Like',
                                      style: Fonts.noto(
                                        context,
                                        AppColors.white,
                                        12,
                                        FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )),
                            const Spacer(),
                            Text(
                              '${controller.bloomingData[index].likes} likes',
                              style: Fonts.noto(
                                context,
                                AppColors.white,
                                12,
                                FontWeight.w400,
                              ),
                            )
                          ],
                        ).paddingAll(8)
                      ],
                    )),
                  );
                },
              ).paddingSymmetric(horizontal: 16.w),
            );
          }),
    );
  }
}
