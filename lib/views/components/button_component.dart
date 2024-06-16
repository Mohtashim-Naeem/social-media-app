import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.backgroundColor,
      required this.onPressed,
      required this.buttonText,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.isLoading = false,
      this.padding,
      this.isDisable = false});
  final double? height;
  final double? width;
  final double? radius;
  final Color? backgroundColor;
  final void Function() onPressed;
  final String buttonText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 13.4,
            offset: const Offset(0, 10),
            spreadRadius: 0,
            color: AppColors.black.withOpacity(0.12))
      ]),
      child: ElevatedButton(
        onPressed: isDisable
            ? null
            : isLoading
                ? () {}
                : onPressed,
        style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.brightGray,
            backgroundColor: backgroundColor ?? AppColors.buttonColor,
            alignment: Alignment.center,
            padding: padding,
            shadowColor: AppColors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 8.r)),
            fixedSize: Size(width ?? double.maxFinite,
                Utils.isTablet(context) ? 50.h : height ?? 44.h)),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                    color: AppColors.white, strokeWidth: 2.5),
              )
            : Text(
                buttonText,
                style: Fonts.noto(
                  context,
                  isDisable
                      ? AppColors.gray
                      : fontColor ?? AppColors.raisinBlack,
                  fontSize ?? 14,
                  fontWeight ?? FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
