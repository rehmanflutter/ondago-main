import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DurationOfService extends StatelessWidget {
  const DurationOfService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(95),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hours',
            style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: Adaptive.px(70),
            width: Adaptive.px(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xff282773),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '06',
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 30),
          Text(
            'Minutes',
            style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: Adaptive.px(70),
            width: Adaptive.px(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xff282773),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '06',
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
