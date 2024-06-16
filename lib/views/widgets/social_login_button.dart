import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.vector,
      this.isLoading = false,
      this.isDisable = false});
  final void Function() onPressed;
  final String buttonText;
  final String vector;
  final bool isLoading;
  final bool isDisable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable
          ? null
          : isLoading
              ? () {}
              : onPressed,
      child: Container(
          height: Utils.isTablet(context) ? 58.h : 48.h,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.magicMint, strokeWidth: 2.5),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        vector,
                        height: Utils.isTablet(context) ? 30.h : 20.h,
                        width: 20.w,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(buttonText,
                          style: Fonts.noto(context, AppColors.raisinBlack, 14,
                              FontWeight.w700)),
                    ),
                  ],
                )),
    );
  }
}
