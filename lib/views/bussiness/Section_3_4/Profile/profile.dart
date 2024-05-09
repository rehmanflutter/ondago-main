import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Bussiness_Controller/Section_3_4_Controller/profile_Controller.dart';
import 'package:ondago/views/bussiness/Section_3_4/Profile/edit_profile.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreens extends StatefulWidget {
  ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  final Controller = Get.put(ProfileControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xff282773),
                        )),
                    TextCustom(
                      text: 'Profile',
                      size: 16,
                      weight: FontWeight.w700,
                      col: Color(0xff282773),
                    ),
                    SizedBox()
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(Images.me),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextCustom(
                  text: 'Linda Steves',
                  size: 17,
                  weight: FontWeight.w700,
                  col: Color(0xff282773),
                ),
                SizedBox(
                  height: 2,
                ),
                TextCustom(
                  text: 'Childcare Services',
                  size: 17,
                  weight: FontWeight.w500,
                  col: Color(0xff8590B6),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextCustom(
                    text: '   contact Info',
                    size: 14,
                    weight: FontWeight.w600,
                    col: Color(0xff282773),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustamContainer(
                  wigth: double.infinity,
                  cir: 15,
                  col: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(Images.calls),
                        title: TextCustom(
                          text: 'Business Name',
                          size: 15,
                          weight: FontWeight.w700,
                          col: Color(0xff282773),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(Images.bank2),
                        title: TextCustom(
                          text: 'business@gmail.com',
                          size: 15,
                          weight: FontWeight.w700,
                          col: Color(0xff282773),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(Images.emailbank),
                        title: TextCustom(
                          text: '+321-312-0332',
                          size: 15,
                          weight: FontWeight.w700,
                          col: Color(0xff282773),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextCustom(
                    text: '   business type',
                    size: 14,
                    weight: FontWeight.w600,
                    col: Color(0xff282773),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustamContainer(
                  wigth: double.infinity,
                  col: Colors.white,
                  cir: 15,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffDFDFDF))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(Images.businesstype),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                underline: SizedBox(),
                                isExpanded: true,
                                value: Controller.selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    Controller.selectedValue = newValue;
                                  });
                                },
                                items: Controller.items
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: TextCustom(
                                      text: value,
                                      size: 12,
                                      weight: FontWeight.w300,
                                      col: Color(0xff282773),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // About
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextCustom(
                    text: '   About  ',
                    size: 14,
                    weight: FontWeight.w600,
                    col: Color(0xff282773),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustamContainer(
                  cir: 20,
                  col: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: TextCustom(
                      text:
                          'Lorem ipsum dolor sit amet consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis quis. Tincidunt egestas at urna pellentesque hendrerit erat proin. Faucibus amet mauris pretium vivamus posuere vitae integer non lectus. ',
                      size: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CommonButton(
                    onTap: () {
                      Get.to(EditProfiles());
                    },
                    title: 'Edit Profile'),
                SizedBox(
                  height: 4.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
