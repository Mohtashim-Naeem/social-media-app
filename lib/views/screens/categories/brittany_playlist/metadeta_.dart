import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MusicMetaDetaWidget extends StatelessWidget {
  const MusicMetaDetaWidget(
      {super.key,
      required this.songTitle,
      required this.songImage,
      required this.artistName,
      required this.songDesc});

  final String songTitle;
  final String songImage;
  final String artistName;
  final String songDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
                height: 340.h,
                width: Get.width,
                imageUrl: songImage,
                fit: BoxFit.cover),
          ),
        ),
        Text(
          songTitle, //'Garden City',
          style: Fonts.noto(
            context,
            AppColors.white,
            24,
            FontWeight.w600,
          ),
        ),
        Text(
          artistName, //'Thomas Austin',
          style: Fonts.noto(
            context,
            const Color(0xffC2C2C2),
            15,
            FontWeight.w400,
          ),
        ),
        Text(
          songDesc,
          style: Fonts.noto(
            context,
            AppColors.white,
            12,
            FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
