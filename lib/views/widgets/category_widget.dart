import 'dart:ui';

import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategorieCardWidget extends StatelessWidget {
  const CategorieCardWidget(
      {super.key,
      required this.isUnlocked,
      required this.image,
      required this.categorieName,
      this.onTap});
  final bool isUnlocked;
  final String image;
  final String categorieName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var height = 224.h;
    var width = double.infinity;
    return isUnlocked
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
                height: height,
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(image),
                    // image: CachedNetworkImageProvider(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.raisinBlack.withOpacity(0.0),
                            AppColors.raisinBlack,
                          ])),
                  padding: EdgeInsets.only(bottom: 14.h, left: 14.w),
                  child: Text(
                    categorieName,
                    style: Fonts.noto(
                        context, AppColors.white, 16.sp, FontWeight.w700),
                  ),
                )),
          )
        : Stack(
            fit: StackFit.loose,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    height: height,
                    width: width,
                    // margin:
                    //     EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: AssetImage(image),
                        // image: CachedNetworkImageProvider(image),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  )),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.raisinBlack.withOpacity(0.0),
                              AppColors.raisinBlack.withOpacity(0.81),
                            ])),
                    padding: EdgeInsets.only(bottom: 14.h, left: 14.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          categorieName,
                          style: Fonts.noto(
                              context, AppColors.white, 16.sp, FontWeight.w700),
                        ),
                        VerticalSpacing(18.h),
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                              alignment: Alignment.center,
                              width: 70.w,
                              height: 26.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: AppColors.white.withOpacity(0.56),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Unlock',
                                style: Fonts.noto(
                                  context,
                                  AppColors.black,
                                  10.sp,
                                  FontWeight.w600,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   height: height,
              //   width: width,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12.r),
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [
              //             AppColors.raisinBlack.withOpacity(0.0),
              //             AppColors.raisinBlack.withOpacity(0.81),
              //           ])),
              //   padding: EdgeInsets.only(bottom: 14.h, left: 14.w),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         categorieName,
              //         style: Fonts.noto(
              //             context, AppColors.white, 16.sp, FontWeight.w700),
              //       ),
              //       VerticalSpacing(18.h),
              //       Container(
              //           alignment: Alignment.center,
              //           width: 70.w,
              //           height: 26.h,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(50.r),
              //             color: AppColors.white.withOpacity(0.56),
              //           ),
              //           child: Text(
              //             textAlign: TextAlign.center,
              //             'Unlock',
              //             style: Fonts.noto(
              //               context,
              //               AppColors.black,
              //               10.sp,
              //               FontWeight.w600,
              //             ),
              //           ))
              //     ],
              //   ),
              // ),
            ],
          ).marginSymmetric(
            horizontal: 16.w,
            vertical: 12.h,
          );

    // : Stack(

    //     fit: StackFit.expand,
    //     children: [
    // ClipRRect(
    //   borderRadius: BorderRadius.circular(16.r),
    //   child: ImageFiltered(
    //     imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    //     child: CachedNetworkImage(
    //       fit: BoxFit.cover,
    //       imageUrl: image,
    //     ),
    //   ),
    // ),
    //       ClipRRect(
    //           borderRadius: BorderRadius.circular(16.r),
    //           child: ColoredBox(color: AppColors.black.withOpacity(0.14))),
    //       SizedBox(
    //           height: 226.h,
    //           width: 168.w,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 categorieName,
    //                 style: Fonts.axiforma(
    //                     context, AppColors.white, 16.sp, FontWeight.w400),
    //               ),
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Icon(
    //                     Icons.star_rounded,
    //                     color: AppColors.yellow,
    //                     size: 18.h,
    //                   ),
    //                   Text(
    //                     rating.toString(),
    //                     style: Fonts.axiforma(context, AppColors.white,
    //                         14.sp, FontWeight.w400),
    //                   ),
    //                 ],
    //               ),
    //               GestureDetector(
    //                 onTap: reviewOnTap,
    //                 child: Text('View Reviews',
    //                     style: TextStyle(
    //                         decoration: TextDecoration.underline,
    //                         decorationColor: AppColors.yellow,
    //                         color: AppColors.yellow,
    //                         fontSize: Utils.isTablet(context) ? 18 : 13.sp,
    //                         fontWeight: FontWeight.w400)),
    //               ),
    //               VerticalSpacing(18.h),
    // Container(
    //     width: 112.h,
    //     height: 37.w,
    //     padding: EdgeInsets.symmetric(horizontal: 5.w),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(50.r),
    //         color: AppColors.white.withOpacity(0.56)),
    //     child: FittedBox(
    //       fit: BoxFit.scaleDown,
    //       child: Center(
    //         child: Text(
    //           textAlign: TextAlign.center,
    //           'Unlock ${Utils.getPrice(price)}',
    //           style: Fonts.axiforma(
    //               context,
    //               AppColors.eerieBlack,
    //               13.sp,
    //               FontWeight.w500),
    //         ),
    //       ),
    //     ))
    //             ],
    //           )),
    //     ],
    //   );
  }
}
