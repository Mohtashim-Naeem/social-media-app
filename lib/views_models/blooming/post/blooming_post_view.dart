import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/widgets/image_post_widget.dart';
import 'package:bloom_app/views_models/blooming/blooming_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BloomingPostView extends StatelessWidget with BLooMBackroundMixin {
  const BloomingPostView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: GetBuilder<BloomingViewModel>(builder: (controller) {
        return Scaffold(
          appBar: const AppBarComponent(
            title: 'Posts',
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                PostImageWidget(
                        postTime: 'Jan 15, 2024',
                        desc: 'The Beauty of Spring Blooms!',
                        totalComments: '56',
                        totalLikes: '50',
                        postImage: image)
                    .marginOnly(bottom: 8.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.bloomingData.length,
                  itemBuilder: (context, index) {
                    final data = controller.bloomingData[index];
                    return PostImageWidget(
                            postTime: 'Jan 15, 2024',
                            desc: data.description,
                            totalComments: '56',
                            totalLikes: data.likes.toString(),
                            postImage: data.image.toString())
                        .marginOnly(bottom: 8.h);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
