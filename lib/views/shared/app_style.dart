import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double fSize, Color tColor, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: fSize, color: tColor, fontWeight: fw);
}

TextStyle appStyleWithHt(double fSize, Color tColor, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: fSize, color: tColor, fontWeight: fw, height: ht);
}
