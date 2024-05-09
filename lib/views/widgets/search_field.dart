import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchCtrl,
  });

  final TextEditingController searchCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(33),
      width: Adaptive.w(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffE1ECFF)),
      ),
      child: TextFormField(
        controller: searchCtrl,
        onChanged: (value) {},
        validator: (value) {
          return '';
        },
        style: GoogleFonts.poppins(
            color: const Color(0xff282773),
            fontSize: 12,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          prefixIcon: Image.asset('assets/icons/search.png'),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 12,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
