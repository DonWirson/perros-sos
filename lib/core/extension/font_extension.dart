import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension FontExtension on TextTheme {
  TextStyle get title1 {
    return GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get h1 {
    return GoogleFonts.raleway(
      fontSize: 26,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get h2 {
    return GoogleFonts.raleway(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get h3 {
    return GoogleFonts.raleway(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get h4 {
    return GoogleFonts.raleway(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get h4Hypertext {
    return GoogleFonts.raleway(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    );
  }

  TextStyle get labelText {
    return GoogleFonts.lato(
      fontSize: 14,
    );
  }

  TextStyle get hintText {
    return GoogleFonts.raleway(
      fontSize: 12,
    );
  }
}
