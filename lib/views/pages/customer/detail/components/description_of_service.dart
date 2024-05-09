import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DescriptionOfService extends StatelessWidget {
  const DescriptionOfService({
    super.key,
    required this.descriptionCtrl,
  });

  final TextEditingController descriptionCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(121),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              // child: CommonField(
              //   maxLines: 4,
              //   hintText: 'describe here.....',
              //   controller: descriptionCtrl,
              //   prefixIcon: 'prefixIcon',
              //   onChanged: (value) {},
              //   validator: (value) {
              //     return '';
              //   },
              //   isPrefix: false,
              // ),

              child: TextFormField(
                maxLines: 4,
                onChanged: (value) {},
                validator: (value) {
                  return '';
                },
                controller: descriptionCtrl,
                style: GoogleFonts.poppins(
                  color: const Color(0xff282773),
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, top: 20),
                  hintText: 'describe here.....',
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
              )),
        ],
      ),
    );
  }
}
