import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/post_box_component.dart';
import 'package:bloom_app/views/components/tabbar_component.dart';
import 'package:bloom_app/views/screens/drawer/subscriptions/subscription_plans.dart';
import 'package:bloom_app/views/widgets/category_widget.dart';
import 'package:bloom_app/views_models/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget with BLooMBackroundMixin {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder(
          init: HomeViewModel(),
          builder: (controller) {
            return DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Scaffold(
                  body: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome Back, Danial!',
                          style: Fonts.caveat(
                              context, AppColors.black, 18, FontWeight.w700),
                        ),
                        // Flexible(
                        //   child: ButtonComponent(
                        //       onPressed: () {},
                        //       buttonText: 'Donate to Ministry'),
                        // ),
                        // FittedBox(

                        //   child: Center(
                        //     child: Text(
                        //       'Donate to Ministry',
                        //       style: Fonts.noto(context, AppColors.black, 10,
                        //           FontWeight.w600),
                        //     ),
                        //   ),
                        // )
                        FittedBox(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              // height: 30.h,
                              // // width: 104.w,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: const Color(0xffBA89C8),
                              ),
                              child: Center(
                                child: Text(
                                  'Donate to Ministry',
                                  style: Fonts.noto(context, AppColors.black,
                                      10, FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 16.w),
                    VerticalSpacing(16.h),
                    const TabBarComponent(
                        firstTab: 'BLM Feed', secondTab: 'Brittany’s Corner'),
                    VerticalSpacing(16.h),
                    Expanded(
                        child: TabBarView(children: [
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.postData.length,
                        itemBuilder: (context, index) {
                          final data = controller.postData[index];
                          return PostBoxComponent(
                            postData: PostData(
                                likeOnTap: () {
                                  controller.updateLikeStatus(index);
                                },
                                isLiked: data.like!,
                                types: data.postType!,
                                title: data.title.toString(),
                                postTime: data.postTime.toString(),
                                desc: data.desc.toString(),
                                eventDateTime: data.eventDateTime.toString(),
                                eventLocation: data.eventLocation.toString(),
                                eventTitle: data.eventTitle.toString(),
                                postImage: data.postImage.toString(),
                                thumnail: data.thumnail.toString(),
                                totalComments: data.totalComments.toString(),
                                totalInterests: data.totalInterests.toString(),
                                totalLikes: data.totalLikes.toString()),
                          ).paddingOnly(bottom: 8.h);
                        },
                      ),
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 100.h),
                        itemCount: controller.category.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              index == 0 || index == 1
                                  ? Get.to(() =>
                                      controller.categoriesDestination[index])
                                  : controller.unlock
                                      ? Get.to(() => controller
                                          .categoriesDestination[index])
                                      : () {};
                            },
                            child: CategorieCardWidget(
                                onTap: () {
                                  Get.to(() => SubscriptionPlansView(),
                                      arguments: {'payment': false});
                                },
                                isUnlocked: controller.unlock == false
                                    ? controller.category[index]['unlocked']
                                    : controller.unlock,
                                image: controller.category[index]['image'],
                                categorieName: controller.category[index]
                                    ['name']),
                          );
                        },
                      )
                    ])),
                  ]),
                ));
          }),
    );
  }
}
