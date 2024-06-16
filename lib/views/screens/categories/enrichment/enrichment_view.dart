import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/textfield_component.dart';
import 'package:bloom_app/views/screens/categories/enrichment/post/enrichment_post_view.dart';
import 'package:bloom_app/views_models/enrichment/enrichment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EnrichmentView extends StatelessWidget with BLooMBackroundMixin {
  const EnrichmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder(
          init: EnrichmentViewModel(),
          builder: (controller) {
            return Scaffold(
                appBar: const AppBarComponent(
                  isFlowerAppBar: true,
                  flowerImage: AppImages.enrichmentFlower,
                  title: 'Enrichment',
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
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
                      ...List.generate(
                          10,
                          (index) => InkWell(
                                onTap: () {
                                  Get.to(() => const EnrichmentPostView());
                                },
                                child: Container(
                                  // height: 132,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8),
                                  margin: EdgeInsets.only(bottom: 16.h),
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.cardColor.withOpacity(0.31),
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 85.h,
                                            width: 96.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Enrichment.png'),
                                                    fit: BoxFit.cover)),
                                            child: Center(
                                              child: CircleAvatar(
                                                  backgroundColor: AppColors
                                                      .raisinBlack
                                                      .withOpacity(0.81),
                                                  radius: 10.r,
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    size: 13.h,
                                                    color: AppColors.white,
                                                  )),
                                            ),
                                          ),
                                          HorizontalSpacing(9.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Finding Inner Peace',
                                                  style: Fonts.noto(
                                                      context,
                                                      AppColors.black,
                                                      14,
                                                      FontWeight.w600),
                                                ),
                                                Text(
                                                  'In this soul nurturing sermon, speaker John A. Doe gently guides listener...',
                                                  style: Fonts.noto(
                                                      context,
                                                      AppColors.black,
                                                      12,
                                                      FontWeight.w400),
                                                ),
                                                VerticalSpacing(8.h),
                                                Text(
                                                  'Jan 15, 2024 - 1hr 14min',
                                                  style: Fonts.noto(
                                                      context,
                                                      AppColors.grayniteGray,
                                                      10,
                                                      FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      VerticalSpacing(8.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up_sharp,
                                            color: AppColors.magentaPink,
                                            size: 15.h,
                                          ),
                                          HorizontalSpacing(3.w),
                                          Text(
                                            '561',
                                            style: Fonts.noto(
                                                context,
                                                AppColors.raisinBlack,
                                                10,
                                                FontWeight.w400),
                                          ),
                                          HorizontalSpacing(18.w),
                                          Text(
                                            '109 Comments',
                                            style: Fonts.noto(
                                                context,
                                                AppColors.raisinBlack,
                                                10,
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      VerticalSpacing(10.h),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ).paddingSymmetric(horizontal: 16.w),
                ));
          }),
    );
  }
}
