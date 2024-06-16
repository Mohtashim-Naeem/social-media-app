import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';

class InfoRichTextComponent extends StatelessWidget {
  const InfoRichTextComponent(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.firstTextColor,
      this.secondTextColor,
      this.firstTextSize,
      this.secondTextSize,
      this.firstTextWeight,
      this.secondTextWeight,
      this.firstStyle,
      this.secondStyle});
  final String firstText;
  final String secondText;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final double? firstTextSize;
  final double? secondTextSize;
  final FontWeight? firstTextWeight;
  final FontWeight? secondTextWeight;
  final TextStyle? firstStyle;
  final TextStyle? secondStyle;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: firstText,
          style: firstStyle ??
              Fonts.noto(context, AppColors.black, 12, FontWeight.w700)
                  .copyWith(
                      color: firstTextColor,
                      fontSize: firstTextSize,
                      fontWeight: firstTextWeight)),
      TextSpan(
          text: secondText,
          style: secondStyle ??
              Fonts.noto(context, AppColors.black, 12, FontWeight.w400)
                  .copyWith(
                      color: secondTextColor,
                      fontSize: secondTextSize,
                      fontWeight: secondTextWeight)),
    ]));
  }
}
