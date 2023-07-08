import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double fSize, Color tColor, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: fSize.sp, color: tColor, fontWeight: fw);
}

TextStyle appStyleWithHt(double fSize, Color tColor, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: fSize.sp, color: tColor, fontWeight: fw, height: ht);
}

class ReuseableText extends StatelessWidget {
  const ReuseableText({super.key, required this.text, required this.style});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.left,
      softWrap: false,
      style: style,
    );
  }
}
