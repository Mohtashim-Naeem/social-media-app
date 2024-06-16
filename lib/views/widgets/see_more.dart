import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/components/fadding_item_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class SeeMoreTextComponent extends StatelessWidget {
  const SeeMoreTextComponent({
    super.key,
    required this.subTitle,
    this.maxLines = 2,
  });
  final String subTitle;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FadingTextItem(
        // physics: const BouncingScrollPhysics(),
        childToShade: ReadMoreText(
          subTitle,
          trimMode: TrimMode.Line,
          trimLines: maxLines,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          style: Fonts.noto(context, AppColors.white, 12, FontWeight.w400),
          lessStyle: Fonts.noto(context, AppColors.white, 12, FontWeight.w500),
          moreStyle: Fonts.noto(context, AppColors.white, 12, FontWeight.w500),
        ).paddingOnly(bottom: 10),
      ),
    );
  }
}
