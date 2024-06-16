import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextComponent extends StatelessWidget {
  const RichTextComponent(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.onTap});
  final String firstText;
  final String secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: firstText,
          style:
              Fonts.noto(context, AppColors.raisinBlack, 12, FontWeight.w400)),
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onTap,
          text: secondText,
          style: Fonts.noto(context, AppColors.darkGreen, 12, FontWeight.w700))
    ]));
  }
}
