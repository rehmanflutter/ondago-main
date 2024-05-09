import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ondago/views/auth/ForgotPassword/set_new_Password.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f5fe),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 17.h,
              ),
              Container(
                width: 40.h,
                child: TextCustom(
                  align: TextAlign.center,
                  text: 'Forgot Password?',
                  size: 6.w,
                  weight: FontWeight.w700,
                  col: Color(0xff282773),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                // color: Colors.amber,
                child: TextCustom(
                  align: TextAlign.center,
                  text:
                      'Please enter the email address linked with your account. We will send you reset password link',
                  size: 3.5.w,
                  weight: FontWeight.w500,
                  col: Color(0xff8590B6),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 55),
                  child: Column(
                    children: [
                      Textfiledcustoms(
                        hinttext: 'Enter your Email Address',
                        starticon: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 5, top: 13, bottom: 13),
                          child: SvgPicture.asset(Images.email),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        height: 2.h,
                      ),
                      CommonButton(
                          onTap: () {
                            Get.to(SetNewPassword());
                          },
                          title: 'Send')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
              text: 'Don’t have an account? ',
              size: 15,
              weight: FontWeight.w500,
              col: Color(0xff8590B6),
            ),
            TextCustom(
              text: 'Sign Up',
              size: 15,
              weight: FontWeight.w500,
              col: Color(0xff282773),
            )
          ],
        ),
      ),
    );
  }
}
