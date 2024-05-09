import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/auth/otp_success_verifi.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pinput/pinput.dart';

class PhoneNumberVerification extends StatelessWidget {
  TextEditingController otp = TextEditingController();

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
                  text: 'OTP Verification',
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
                      ' Please enter the 4-digit code we have just sent on your phone number',
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
                      Container(
                          //margin: EdgeInsets.only(left: 20, right: 20),
                          child: Pinput(
                              controller: otp,
                              length: 4,
                              defaultPinTheme: PinTheme(
                                width: 51,
                                height: 60,
                                margin: EdgeInsets.only(right: 3, left: 3),
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    //   color: Color.fromRGBO(30, 60, 87, 1),
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffC9DCFD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ))),
                      SizedBox(height: 7.h),
                      CommonButton(
                          onTap: () {
                            Get.to(SuccessOtpVerification());
                          },
                          title: 'Verify')
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
    );
  }
}
