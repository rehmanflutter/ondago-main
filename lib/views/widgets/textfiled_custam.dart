import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Textfiledcustoms extends StatelessWidget {
  // final formKey = GlobalKey<FormState>();

  final String? hinttext;
  final String? labeltext;
  final Widget? starticon;
  final Widget? lasticon;
  final bool? obscur;
  final VoidCallback? fun;
  final bool? focus;
  final double? height;
  final double? width;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  final String? Function(String?)? validator;

  Textfiledcustoms(
      {this.hinttext,
      this.controller,
      this.labeltext,
      this.lasticon,
      this.obscur = false,
      this.starticon,
      this.keyboardType,
      this.fun,
      this.focus = false,
      this.height,
      this.validator,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffE1ECFF))),
      child: Center(
        child: TextFormField(
          autofocus: focus!,
          validator: validator,

          // key: formKey,
          obscureText: obscur!,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 14,
          ),
          controller: controller,
          cursorColor: Colors.blue,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey),
            labelText: labeltext,
            prefixIcon: starticon,
            suffixIcon: lasticon,
            border: InputBorder.none,
            prefixText: '  ',
          ),

          onChanged: (value) {
            fun;
          },
        ),
      ),
    );
  }
}
