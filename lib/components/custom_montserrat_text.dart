import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMontserratText extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const CustomMontserratText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.montserrat(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    );
  }
}
