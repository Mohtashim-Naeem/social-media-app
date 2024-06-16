import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/svgs/app_vectors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PopupMenuButtonComponent extends StatelessWidget {
  const PopupMenuButtonComponent({
    super.key,
    this.onSelected,
    required this.elements,
    this.icon,
    // this.textOneColor,
    // this.textTwoColor,
    // this.textThreeColor,
  });

  final void Function(String)? onSelected;
  final List<String> elements;
  final Widget? icon;
  // final Color? textOneColor;
  // final Color? textTwoColor;
  // final Color? textThreeColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      constraints: BoxConstraints.expand(width: 153.w, height: 142.h),
      splashRadius: 30,
      shadowColor: Colors.black,
      position: PopupMenuPosition.under,
      icon: icon ?? SvgPicture.asset(AppVectors.filterIcon),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12.r),
        bottomRight: Radius.circular(12.r),
        topRight: Radius.circular(0.r),
        topLeft: Radius.circular(12.r),
      )),
      onSelected: onSelected,
      surfaceTintColor: Colors.white,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              height: 33.h,
              value: 'Filter by: Month',
              child: Text('Filter by: Month',
                  style: Fonts.noto(
                    context,
                    AppColors.black,
                    16,
                    FontWeight.w500,
                  ))),
          ...List.generate(
            elements.length,
            (index) => PopupMenuItem(
                height: 33.h,
                value: elements[index],
                child: Text(elements[index],
                    style: Fonts.noto(
                      context,
                      AppColors.black,
                      12.sp,
                      FontWeight.w400,
                    ))),
          )
          // PopupMenuItem(
          //     height: 33.h,
          //     value: elements[1],
          //     child: Text(elements[1],
          //         style: Fonts.axiforma(
          //           context,
          //           textTwoColor ?? AppColors.black,
          //           12.sp,
          //           FontWeight.w400,
          //         ))),
          // PopupMenuItem(
          //     height: 33.h,
          //     value: elements[2],
          //     child: Text(elements[2],
          //         style: Fonts.axiforma(
          //           context,
          //           textThreeColor ?? AppColors.black,
          //           12.sp,
          //           FontWeight.w400,
          //         ))),
        ];
      },
    );
  }
}
