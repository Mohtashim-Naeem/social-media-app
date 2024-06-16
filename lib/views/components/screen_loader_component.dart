import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({super.key, required this.child, required this.isLoading});
  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: [
        child,
        isLoading
            ? BackdropFilter(
                filter: ColorFilter.mode(
                    AppColors.raisinBlack.withOpacity(0.50), BlendMode.darken),
                blendMode: BlendMode.darken,
                child: SizedBox(
                  height: 50.h,
                  width: 48.w,
                  child: CircularProgressIndicator(
                    color: AppColors.magentaPink,
                    backgroundColor: AppColors.magentaPink.withOpacity(0.10),
                  ),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
