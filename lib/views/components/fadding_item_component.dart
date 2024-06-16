import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FadingTextItem extends StatelessWidget {
  final Widget childToShade;

  const FadingTextItem({super.key, required this.childToShade});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment(0.0,
              0.1), // Adjust the end point to cover less space at the bottom
          colors: [
            Colors.transparent,
            AppColors.raisinBlack,
            AppColors.raisinBlack,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), child: childToShade),
    );
  }
}
