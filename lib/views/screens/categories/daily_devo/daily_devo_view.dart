import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/components/pop_menu.dart';
import 'package:bloom_app/views/components/tabbar_component.dart';
import 'package:bloom_app/views/screens/categories/daily_devo/post/daily_devo_post_view.dart';
import 'package:bloom_app/views/widgets/daily_devo_tile.dart';
import 'package:bloom_app/views/widgets/image_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DailyDevoView extends StatelessWidget with BLooMBackroundMixin {
  const DailyDevoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
          appBar: const AppBarComponent(
            isFlowerAppBar: true,
            flowerImage: AppImages.roseFlower,
            title: 'Daily Devo',
            actions: [
              PopupMenuButtonComponent(elements: [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'
              ]),
            ],
          ),
          body: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                const TabBarComponent(
                    firstTab: 'Daily Devotion',
                    secondTab: 'Devotions of the Month'),
                VerticalSpacing(16.h),
                Expanded(
                  child: TabBarView(children: [
                    const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: PostImageWidget(
                          title: 'Matthew 18:15-22',
                          postTime: '18:15-22',
                          desc:
                              'Some people say the most difficult part of any job is not the task itself or the challenge involved but getting involved with coworkers. Are you surprised? Getting along with colleagues and navigating workplace dynamics can indeed be challenging, often requiring patience, empathy, and effective communication.   However, fostering positive relationships with coworkers can also enhance productivity, collaboration, and overall job satisfaction. It’s essential to recognize the importance of teamwork and interpersonal skills in creating a harmonious and successful work environment.',
                          totalComments: '56',
                          totalLikes: '20',
                          postImage:
                              'https://images.unsplash.com/photo-1713791924903-3b8f4c31dddb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8',
                        )),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => DailyDevoTileWidget(
                              onTap: () {
                                Get.to(() => const DailyDevoPostView());
                              },
                              title: "Matthew 18:15-22",
                              date: "Jan 16, 2023",
                              desc:
                                  'Some people say the most difficult part of any job is not the task itself or the challenge involved but getting involved with coworkers. Are you surprised?',
                              image: 'assets/images/dail-devo.png',
                            ).marginSymmetric(horizontal: 16.w)),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
