import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.magentaPink
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5; // Width of each dash
    const double dashSpace = 5; // Space between each dash

    // Center of the canvas is the center of the circle
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = math.min(size.width / 2, size.height / 2);

    // Total circumference of the circle
    final double circumference = 2 * math.pi * radius;

    // How many dashes fit in the circumference
    int numberOfDashes = (circumference / (dashWidth + dashSpace)).floor();
    double adjustedDashWidth = dashWidth;
    double adjustedDashSpace = dashSpace;

    // Adjust the dash width and space to fit perfectly in the circle
    double totalDashLength =
        numberOfDashes * (adjustedDashWidth + adjustedDashSpace);
    if (totalDashLength < circumference) {
      adjustedDashSpace += (circumference - totalDashLength) / numberOfDashes;
    }

    // Draw each dash along the circumference
    double angle = 0; // Initial angle
    final double radiansPerDash = 2 * math.pi / numberOfDashes;
    for (int i = 0; i < numberOfDashes; i++) {
      final Offset start =
          center + Offset(math.cos(angle), math.sin(angle)) * radius;
      final Offset end = center +
          Offset(
                  math.cos(angle +
                      radiansPerDash *
                          (adjustedDashWidth /
                              (adjustedDashWidth + adjustedDashSpace))),
                  math.sin(angle +
                      radiansPerDash *
                          (adjustedDashWidth /
                              (adjustedDashWidth + adjustedDashSpace)))) *
              radius;
      canvas.drawLine(start, end, paint);
      angle += radiansPerDash;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
