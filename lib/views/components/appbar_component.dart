import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({
    super.key,
    this.title = "",
    this.backgroundColor,
    this.textColor,
    this.centerTitle,
    this.actions,
    this.fontSize,
    this.fontWeight,
    this.toolbarHeight,
    this.elevation,
    this.isFlowerAppBar = false,
    this.flowerImage,
  });

  final String? title;
  final List<Widget>? actions;

  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? toolbarHeight;
  final double? elevation;
  final bool isFlowerAppBar;
  final String? flowerImage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      toolbarHeight: toolbarHeight ?? 70.h,
      centerTitle: centerTitle ?? false,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: isFlowerAppBar
          ? Row(
              children: [
                Text(
                  title.toString(),
                  style: Fonts.caveatBrush(
                      context,
                      textColor ?? AppColors.black,
                      fontSize ?? 20,
                      fontWeight ?? FontWeight.w400),
                ),
                Image.asset(
                  flowerImage.toString(),
                  height: 38.h,
                  width: 38.w,
                )
              ],
            )
          : Text(
              title.toString(),
              style: Fonts.caveatBrush(context, textColor ?? AppColors.black,
                  fontSize ?? 20, fontWeight ?? FontWeight.w400),
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
