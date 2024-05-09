import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/colour_sclass.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void playVideoDialogue(BuildContext context) {
  showDialog(
      barrierColor: Colors.white.withOpacity(0.5),
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryColor,
                image: const DecorationImage(
                    image: AssetImage('assets/images/gashtiya.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(Images.CANCEL),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void showInterestedPopup(BuildContext context) {
  TextEditingController controller = TextEditingController();
  showDialog(
      barrierColor: Colors.white.withOpacity(0.5),
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 25.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, top: 10, bottom: 3),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(Images.CANCEL)),
                        ),
                      ],
                    ),
                    TextCustom(
                      text: 'Send Offer',
                      col: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 4.5.h,
                        child: Material(
                          color: AppColors.primaryColor,
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 14),
                            decoration: InputDecoration(
                                hintText: "Enter Amount",
                                hintStyle: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 14),
                                contentPadding: EdgeInsets.zero,
                                filled: true,
                                fillColor: AppColors.primaryColor,
                                prefixIcon: Icon(
                                  Icons.monetization_on_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: SizedBox(
                    height: 4.h,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(7)),
                      child: TextCustom(
                        text: 'Send Offer',
                        col: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
