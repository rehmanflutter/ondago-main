import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? col;
  final FontWeight? weight;
  final double? size;
  final TextAlign? align;
  final bool? underline;
  TextCustom(
      {required this.text,
      this.weight,
      this.col = Colors.black,
      this.size,
      this.align,
      this.underline = false});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      '$text',
      style: GoogleFonts.poppins(
        color: col,
        fontSize: size,
        fontWeight: weight,
        decoration: underline == true ? TextDecoration.underline : null,
        decorationColor: col,
        decorationThickness: 1.0,
      ),
    );
  }
}
