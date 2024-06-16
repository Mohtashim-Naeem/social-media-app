import 'package:bloom_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle poppins(BuildContext context, Color color, double fontsize,
      FontWeight fontweight) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: Utils.isTablet(context)
          ? fontsize >= 20
              ? 24
              : fontsize <= 10
                  ? 10
                  : 18
          : fontsize.sp,
      fontWeight: fontweight,
    );
  }

  static TextStyle noto(BuildContext context, Color color, double fontsize,
      FontWeight fontweight) {
    return GoogleFonts.notoSans(
      color: color,
      fontSize: Utils.isTablet(context)
          ? fontsize >= 20
              ? 24
              : fontsize <= 10
                  ? 10
                  : 18
          : fontsize.sp,
      fontWeight: fontweight,
    );
  }

  static TextStyle caveatBrush(BuildContext context, Color color,
      double fontsize, FontWeight fontweight) {
    return GoogleFonts.caveatBrush(
      color: color,
      fontSize: Utils.isTablet(context)
          ? fontsize >= 20
              ? 24
              : fontsize <= 10
                  ? 10
                  : 18
          : fontsize.sp,
      fontWeight: fontweight,
    );
  }

  static TextStyle caveat(BuildContext context, Color color, double fontsize,
      FontWeight fontweight) {
    return GoogleFonts.caveat(
      color: color,
      fontSize: Utils.isTablet(context)
          ? fontsize >= 20
              ? 24
              : fontsize <= 10
                  ? 10
                  : 18
          : fontsize.sp,
      fontWeight: fontweight,
    );
  }
}
// class FontAxiforma extends StatelessWidget {
//   const FontAxiforma({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }