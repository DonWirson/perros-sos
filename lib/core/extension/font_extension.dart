import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension FontExtension on TextTheme {
  TextStyle get title1 {
    return GoogleFonts.raleway(
      fontSize: 20,
    );
  }
}
