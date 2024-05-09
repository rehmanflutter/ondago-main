import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/auth_Controller/sigin_controller.dart';
import 'package:ondago/views/Splash_and_onboarding/choose_suits_you_best.dart';
import 'package:ondago/views/auth/ForgotPassword/forgot_password.dart';
import 'package:ondago/views/auth/sign_up.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final controller = Get.put(SignInController());
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
                height: 10.h,
              ),
              Container(
                width: 40.h,
                child: TextCustom(
                  align: TextAlign.center,
                  text: 'Welcome back! Glad to see you, Again!',
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
                      ' Please enter the email address and password linked with your account.',
                  size: 3.5.w,
                  weight: FontWeight.w500,
                  col: Color(0xff8590B6),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Column(
                    children: [
                      Textfiledcustoms(
                        hinttext: 'Enter your Email',
                        starticon: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 5, top: 13, bottom: 13),
                          child: SvgPicture.asset(Images.email),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Obx(
                        () => Textfiledcustoms(
                          obscur: controller.passwordshow.value,
                          hinttext: 'enter your Password',
                          lasticon: GestureDetector(
                            onTap: () {
                              if (controller.passwordshow.value == true) {
                                controller.passwordshow.value = false;
                              } else {
                                controller.passwordshow.value = true;
                              }
                            },
                            child: Icon(
                              controller.passwordshow.value != true
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xff061E37),
                            ),
                          ),
                          starticon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 5, top: 12, bottom: 12),
                            child: SvgPicture.asset(Images.luck),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ForgotPassword());
                          },
                          child: TextCustom(
                            text: 'Forgot Password?',
                            size: 12,
                            weight: FontWeight.w300,
                            col: Color(0xff282773),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CommonButton(
                          onTap: () {
                            Get.to(ShooseSuitsYouBest());
                          },
                          title: 'Sign in')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(child: Divider()),
                  TextCustom(text: '   or   '),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustamContainer(
                    hight: 7.5.h,
                    wigth: 13.h,
                    cir: 10,
                    col: Colors.white,
                    child: SvgPicture.asset(Images.facebook),
                  ),
                  CustamContainer(
                    hight: 7.5.h,
                    wigth: 13.h,
                    cir: 10,
                    col: Colors.white,
                    child: SvgPicture.asset(Images.google),
                  ),
                  CustamContainer(
                    hight: 7.5.h,
                    wigth: 13.h,
                    cir: 10,
                    col: Colors.white,
                    child: SvgPicture.asset(Images.apple),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'Don’t have an account? ',
                    size: 15,
                    weight: FontWeight.w500,
                    col: Color(0xff8590B6),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: TextCustom(
                      text: 'Sign Up',
                      size: 15,
                      weight: FontWeight.w500,
                      col: Color(0xff282773),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
