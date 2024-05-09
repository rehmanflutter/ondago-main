import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onTap,
    required this.title,
    this.textsize = 16.0,
  });
  final VoidCallback onTap;
  final String title;
  final double? textsize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.px(210),
      height: Adaptive.px(47),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(4),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff3A81F7),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: textsize,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
