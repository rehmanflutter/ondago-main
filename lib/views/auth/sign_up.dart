import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ondago/constants/validation_maxin.dart';
import 'package:ondago/controllers/auth_Controller/sigUp_controller.dart';
import 'package:ondago/controllers/auth_controller.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationMixin {
  final controller = Get.put(SigUpController());

  File? image;

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  var formkey = GlobalKey<FormState>();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f5fe),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextCustom(
                    align: TextAlign.center,
                    text: 'Hello! Sign up to get started',
                    size: 6.w,
                    weight: FontWeight.w700,
                    col: const Color(0xff282773),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 78.h,
                      width: double.infinity,
                      //  color: Colors.green,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          height: 69.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 14, top: 40),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 3.5.h,
                                ),
                                Textfiledcustoms(
                                  controller: authController.fullNameCont,
                                  hinttext: 'Full Name',
                                  starticon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 5,
                                        top: 13,
                                        bottom: 13),
                                    child: SvgPicture.asset(Images.person),
                                  ),
                                  validator: (value) {
                                    return isFullNameValid(value!)
                                        ? null
                                        : 'Requried';
                                  },
                                ),
                                SizedBox(height: 2.h),
                                Textfiledcustoms(
                                  controller: authController.emailCont,
                                  hinttext: 'Enter your Email Address',
                                  starticon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 5,
                                        top: 13,
                                        bottom: 13),
                                    child: SvgPicture.asset(Images.email),
                                  ),
                                  validator: (value) {
                                    return isFullNameValid(value!)
                                        ? null
                                        : 'Requried';
                                  },
                                ),
                                SizedBox(height: 2.h),
                                Container(
                                  height: 7.5.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffE1ECFF))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Stack(
                                          children: [
                                            CountryCodePicker(
                                              padding: EdgeInsets.all(0),
                                              initialSelection: 'pk',
                                              favorite: ['+92', 'pk'],
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                              showFlag: true,
                                              hideMainText: true,
                                              showCountryOnly: false,
                                            ),
                                            Positioned(
                                                right: -8,
                                                bottom: 12,
                                                child: Icon(Icons
                                                    .arrow_drop_down_rounded)),
                                          ],
                                        ),
                                        TextCustom(
                                          text: ' |  ',
                                          col: Colors.grey,
                                          size: 25,
                                          weight: FontWeight.w200,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            validator: (value) {
                                              return isFullNameValid(value!)
                                                  ? null
                                                  : 'Requried';
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                hintText: 'phone number',
                                                border: InputBorder.none),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Obx(
                                  () => Textfiledcustoms(
                                    controller: authController.emailCont,
                                    obscur: controller.passwordshow.value,
                                    hinttext: 'enter your Password',
                                    validator: (value) {
                                      return isFullNameValid(value!)
                                          ? null
                                          : 'Requried';
                                    },
                                    lasticon: GestureDetector(
                                      onTap: () {
                                        if (controller.passwordshow.value ==
                                            true) {
                                          controller.passwordshow.value = false;
                                        } else {
                                          controller.passwordshow.value = true;
                                        }
                                      },
                                      child: Icon(
                                        controller.passwordshow.value != true
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xff061E37),
                                      ),
                                    ),
                                    starticon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 5,
                                          top: 12,
                                          bottom: 12),
                                      child: SvgPicture.asset(Images.luck),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Obx(
                                  () => Textfiledcustoms(
                                    controller: authController.emailCont,
                                    obscur:
                                        controller.confirmpasswordshow.value,
                                    hinttext: 'Confirm your Password',
                                    validator: (value) {
                                      return isFullNameValid(value!)
                                          ? null
                                          : 'Requried';
                                    },
                                    lasticon: GestureDetector(
                                      onTap: () {
                                        if (controller
                                                .confirmpasswordshow.value ==
                                            true) {
                                          controller.confirmpasswordshow.value =
                                              false;
                                        } else {
                                          controller.confirmpasswordshow.value =
                                              true;
                                        }
                                      },
                                      child: Icon(
                                        controller.confirmpasswordshow.value !=
                                                true
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xff061E37),
                                      ),
                                    ),
                                    starticon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 5,
                                          top: 12,
                                          bottom: 12),
                                      child: SvgPicture.asset(Images.luck),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Obx(
                                  () => authController.isSignUp.value
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : CommonButton(
                                          onTap: () {
                                            if (authController.emailCont.text.isEmpty ||
                                                authController.fullNameCont.text
                                                    .isEmpty ||
                                                authController
                                                    .emailCont.text.isEmpty ||
                                                authController
                                                    .emailCont.text.isEmpty) {}
                                            //   authController.userRegister(image!);
                                          },
                                          title: 'Sign Up'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      left: 20.h,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        // color: Colors.green,
                        child: Stack(
                          children: [
                            image == null
                                ? const CircleAvatar(
                                    backgroundImage: AssetImage(Images.me),
                                    radius: 60,
                                    backgroundColor: Colors.amber,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(image!),
                                    radius: 60,
                                    backgroundColor: Colors.amber,
                                  ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                    onTap: () {
                                      getImage(ImageSource.gallery);
                                    },
                                    child: SvgPicture.asset(Images.camara))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    TextCustom(text: '   or   '),
                    const Expanded(child: Divider()),
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
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: 'Already have an account? ',
                      size: 15,
                      weight: FontWeight.w500,
                      col: const Color(0xff8590B6),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: TextCustom(
                        text: 'Sign In',
                        size: 15,
                        weight: FontWeight.w500,
                        col: const Color(0xff282773),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
