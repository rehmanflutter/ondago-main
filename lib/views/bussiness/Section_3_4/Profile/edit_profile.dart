import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Bussiness_Controller/Section_3_4_Controller/profile_Controller.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfiles extends StatefulWidget {
  @override
  State<EditProfiles> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<EditProfiles> {
  final controller = Get.put(ProfileControllers());

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
                      text: 'Edit Profile',
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

                Stack(
                  children: [
                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage: AssetImage(Images.me),
                    // ),
                    Obx(
                      () => Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          image: controller.imagess.value != null
                              ? DecorationImage(
                                  image: FileImage(controller.imagess.value!),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(Images.me),
                                  fit: BoxFit.cover,
                                ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                        bottom: 0,
                        right: 1,
                        child: GestureDetector(
                            onTap: () {
                              controller.getImage();
                            },
                            child: SvgPicture.asset(Images.edit)))
                  ],
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
                  col: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Textfiledcustoms(
                          controller: controller.businiessName,
                          starticon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: SvgPicture.asset(Images.businesstype),
                          ),
                          hinttext: 'business Name',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Textfiledcustoms(
                          controller: controller.email,
                          starticon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 13, bottom: 13),
                            child: SvgPicture.asset(Images.email),
                          ),
                          hinttext: 'Enter business Email Address ',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Textfiledcustoms(
                          controller: controller.phoneNo,
                          starticon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 13, bottom: 13),
                            child: SvgPicture.asset(Images.phonecall),
                          ),
                          hinttext: 'Enter  business Number ',
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
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
                                value: controller.selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    controller.selectedValue = newValue;
                                  });
                                },
                                items: controller.items
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
                        horizontal: 15, vertical: 20),
                    child: TextField(
                      controller: controller.about,
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter the description about business'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CommonButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: 'Save Changes'),
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
