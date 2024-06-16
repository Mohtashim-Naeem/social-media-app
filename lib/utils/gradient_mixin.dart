import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

mixin BLooMBackroundMixin {
  BoxDecoration bLooMGradient({BorderRadiusGeometry? borderRadius}) {
    return BoxDecoration(
      borderRadius: borderRadius,
      gradient: const LinearGradient(
        // begin: Alignment.topCenter,
        // end: Alignment.bottomCenter,
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        colors: [
          AppColors.magentaPink,
          AppColors.magicMint,
        ],
      ),
    );
  }
}
