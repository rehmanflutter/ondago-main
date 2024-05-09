import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ondago/controllers/auth_Controller/forgotPassword_Controller.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SetNewPassword extends StatelessWidget {
  final controller = Get.put(ForgotPasswordController());
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
                  text: 'Set a New Password',
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
                      'Your new password must be different from the Previous password',
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Column(
                    children: [
                      Obx(
                        () => Textfiledcustoms(
                          obscur: controller.passwordshow.value,
                          hinttext: 'New Password',
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
                      SizedBox(height: 2.h),
                      Obx(
                        () => Textfiledcustoms(
                          obscur: controller.confirmpasswordshow.value,
                          hinttext: 'Confirm Password',
                          lasticon: GestureDetector(
                            onTap: () {
                              if (controller.confirmpasswordshow.value ==
                                  true) {
                                controller.confirmpasswordshow.value = false;
                              } else {
                                controller.confirmpasswordshow.value = true;
                              }
                            },
                            child: Icon(
                              controller.confirmpasswordshow.value != true
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
                        height: 4.h,
                      ),
                      CommonButton(onTap: () {}, title: 'Save')
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
