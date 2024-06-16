import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/components/post_action_component.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image',
          style: Fonts.noto(context, AppColors.white, 13, FontWeight.w600),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // VerticalSpacing(73.h),
            InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
