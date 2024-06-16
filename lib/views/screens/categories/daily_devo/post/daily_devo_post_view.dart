import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/widgets/image_post_widget.dart';
import 'package:flutter/material.dart';

class DailyDevoPostView extends StatelessWidget with BLooMBackroundMixin {
  const DailyDevoPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: const Scaffold(
        appBar: AppBarComponent(
          isFlowerAppBar: true,
          flowerImage: AppImages.roseFlower,
          title: 'Daily Devo',
        ),
        body: SingleChildScrollView(
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
          ),
        ),
      ),
    );
  }
}
