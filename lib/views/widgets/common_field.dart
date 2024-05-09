import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonField extends StatelessWidget {
  CommonField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    required this.onChanged,
    required this.validator,
    this.isPrefix = true,
    this.maxLines = 1,
  });
  final String hintText;
  final TextEditingController controller;
  final String prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  bool isPrefix;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      style: GoogleFonts.poppins(
        color: const Color(0xff282773),
        fontSize: 12,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: isPrefix ? Image.asset(prefixIcon) : const SizedBox(),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xff282773),
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xffE1ECFF),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xffE1ECFF),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xffE1ECFF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xffE1ECFF),
          ),
        ),
      ),
    );
  }
}
