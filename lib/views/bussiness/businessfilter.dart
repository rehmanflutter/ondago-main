import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ondago/controllers/Bussiness_Controller/busine_filter_controller.dart';
import 'package:ondago/views/bussiness/section5.dart/bussines_home2.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/textfiled_custam.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BusinessFilterScreen extends StatelessWidget {
  BusinessFilterScreen({super.key});
  RxInt selectedIndex = 0.obs; // Default no selection

  final controller = Get.put(BusinessFilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
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
                    text: 'Childcare Business Filter',
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
              TextCustom(
                text: 'Select Location',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                col: Colors.white,
                cir: 15,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              activeColor: Color(0xff3A81F7),
                              value: controller.loctioncheck.value,
                              onChanged: (value) {
                                controller.loctioncheck.value = value!;
                              },
                            ),
                          ),
                          Expanded(
                            child: Textfiledcustoms(
                              starticon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 13, bottom: 13),
                                child: SvgPicture.asset(Images.myloction),
                              ),
                              hinttext: 'My Location',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              activeColor: Color(0xff3A81F7),
                              value: controller.differentcheck.value,
                              onChanged: (value) {
                                controller.differentcheck.value = value!;
                              },
                            ),
                          ),
                          Expanded(
                            child: Textfiledcustoms(
                              starticon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 13, bottom: 13),
                                child: SvgPicture.asset(Images.loction),
                              ),
                              hinttext: 'Different Location',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Container(
                    width: 20.h,
                    //  color: Colors.amber,
                    child: TextCustom(
                      text: 'Search Radius',
                      size: 16,
                      weight: FontWeight.w600,
                      col: Color(0xff282773),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.miles.value = true;
                      },
                      child: CustamContainer(
                        hight: 4.h,
                        wigth: 14.h,
                        cir: 7,
                        borders: true,
                        col: controller.miles.value == true
                            ? Color(0xff3A81F7)
                            : Colors.transparent,
                        bordercol: Color(0xff80A7EB),
                        child: TextCustom(
                          text: 'Miles',
                          col: controller.miles.value == true
                              ? Colors.white
                              : Color(0xff282773),
                          size: 3.5.w,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.miles.value = false;
                      },
                      child: CustamContainer(
                        hight: 4.h,
                        wigth: 14.h,
                        cir: 7,
                        col: controller.miles.value == false
                            ? Color(0xff3A81F7)
                            : Colors.transparent,
                        borders: true,
                        bordercol: Color(0xff80A7EB),
                        child: TextCustom(
                          text: 'Minutes',
                          size: 3.5.w,
                          col: controller.miles.value == false
                              ? Colors.white
                              : Color(0xff282773),
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                col: Colors.white,
                cir: 15,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: GridView.builder(
                    padding: EdgeInsets.all(0),
                    //  scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller
                        .findWorkers.length, //snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedIndex.value = index;
                        },
                        child: Obx(
                          () => CustamContainer(
                            col: selectedIndex == index
                                ? Color(0xff3A81F7)
                                : Color(0xffE1ECFF),
                            cir: 7,
                            child: Center(
                              child: TextCustom(
                                text: controller.findWorkers[index],
                                align: TextAlign.center,
                                col: selectedIndex == index
                                    ? Colors.white
                                    : Color(0xff282773),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of items in a row
                        mainAxisSpacing: 15.0, // Spacing along the main axis
                        crossAxisSpacing: 15.0, // Spacing along the cross axis
                        mainAxisExtent: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextCustom(
                text: 'When You need This Service ',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                col: Colors.white,
                cir: 15,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.now.value == false) {
                                controller.now.value = true;
                              } else {
                                controller.now.value = false;
                              }
                            },
                            child: Obx(
                              () => CustamContainer(
                                  hight: 15,
                                  wigth: 15,
                                  cir: 4,
                                  borders: true,
                                  col: controller.now.value == true
                                      ? Color(0xff3A81F7)
                                      : Colors.transparent),
                            ),
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          TextCustom(
                            text: 'Now',
                            col: Color(0xff282773),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.datetiime.value == false) {
                                controller.datetiime.value = true;
                              } else {
                                controller.datetiime.value = false;
                              }
                            },
                            child: Obx(
                              () => CustamContainer(
                                  hight: 15,
                                  wigth: 15,
                                  cir: 4,
                                  borders: true,
                                  col: controller.datetiime.value == true
                                      ? Color(0xff3A81F7)
                                      : Colors.transparent),
                            ),
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          TextCustom(
                            text: 'Choose custom Date and time',
                            col: Color(0xff282773),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: 'Date',
                                col: Color(0xff282773),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.selectDate(context);
                                },
                                child: CustamContainer(
                                  wigth: 35.w,
                                  hight: 5.h,
                                  borders: true,
                                  cir: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // TextCustom(
                                      //   text:
                                      //       '${controller.selectedDate.toString()}',
                                      // ),
                                      TextCustom(text: '12/02/2024  '),
                                      SvgPicture.asset(Images.datepicker)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: 'Time',
                                col: Color(0xff282773),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.selectTime(context);
                                },
                                child: CustamContainer(
                                  wigth: 35.w,
                                  hight: 5.h,
                                  borders: true,
                                  cir: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextCustom(text: '12:30 pM  '),
                                      SvgPicture.asset(Images.timepicker)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextCustom(
                text: 'Duration of Service',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                col: Colors.white,
                cir: 15,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextCustom(
                        text: 'Hours',
                        size: 14,
                        col: Color(0xff282773),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      CustamContainer(
                        hight: 9.h,
                        wigth: 4.h,
                        cir: 7,
                        bordercol: Color(0xff3491D3),
                        borders: true,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.hour.value++;
                                },
                                child: Icon(Icons.keyboard_arrow_up_outlined)),
                            Obx(
                              () => TextCustom(
                                text: controller.hour.value.toString(),
                                size: 10,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.hour.value--;
                                },
                                child: Icon(Icons.keyboard_arrow_down_rounded)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      TextCustom(
                        text: 'Minutes',
                        size: 14,
                        col: Color(0xff282773),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      CustamContainer(
                        hight: 9.h,
                        wigth: 4.h,
                        cir: 7,
                        bordercol: Color(0xff3491D3),
                        borders: true,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.minut.value++;
                                },
                                child: Icon(Icons.keyboard_arrow_up_outlined)),
                            Obx(
                              () => TextCustom(
                                text: controller.minut.value.toString(),
                                size: 10,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.minut.value--;
                                },
                                child: Icon(Icons.keyboard_arrow_down_rounded)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              //
              // Position Start
//

              TextCustom(
                text: 'Position',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                cir: 15,
                col: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.teacher.value == false) {
                                controller.teacher.value = true;
                              } else {
                                controller.teacher.value = false;
                              }
                            },
                            child: Obx(
                              () => CustamContainer(
                                  hight: 15,
                                  wigth: 15,
                                  cir: 4,
                                  borders: true,
                                  col: controller.teacher.value == true
                                      ? Color(0xff3A81F7)
                                      : Colors.transparent),
                            ),
                          ),
                          TextCustom(text: '  Teacher'),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.babysit.value == false) {
                                controller.babysit.value = true;
                              } else {
                                controller.babysit.value = false;
                              }
                            },
                            child: Obx(
                              () => CustamContainer(
                                  hight: 15,
                                  wigth: 15,
                                  cir: 4,
                                  borders: true,
                                  col: controller.babysit.value == true
                                      ? Color(0xff3A81F7)
                                      : Colors.transparent),
                            ),
                          ),
                          TextCustom(text: '  Baby Sitter'),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.nanny.value == false) {
                                controller.nanny.value = true;
                              } else {
                                controller.nanny.value = false;
                              }
                            },
                            child: Obx(
                              () => CustamContainer(
                                  hight: 15,
                                  wigth: 15,
                                  cir: 4,
                                  borders: true,
                                  col: controller.nanny.value == true
                                      ? Color(0xff3A81F7)
                                      : Colors.transparent),
                            ),
                          ),
                          TextCustom(text: '  Nanny'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              //
              // Description of service Start
//

              TextCustom(
                text: 'Description of service',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                cir: 15,
                col: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: 'describe here.....',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),

              SizedBox(
                height: 3.h,
              ),

              //
              // Upload Image or Video Start
//

              TextCustom(
                text: 'Upload Image or Video',
                size: 16,
                weight: FontWeight.w600,
                col: Color(0xff282773),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustamContainer(
                wigth: double.infinity,
                cir: 15,
                col: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Container(
                            height: 15.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: controller.imagess.value != null
                                  ? DecorationImage(
                                      image:
                                          FileImage(controller.imagess.value!),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: AssetImage(Images.imageupload),
                                      fit: BoxFit.cover,
                                    ),
                              // image: DecorationImage(
                              //     image: AssetImage(Images.uploadVideo),
                              //     fit: BoxFit.cover),
                              border: Border.all(color: Color(0xffE1ECFF)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.getvideo();
                        },
                        child: Container(
                          height: 15.5.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:
                                // controller.video.value != null
                                //     ? DecorationImage(
                                //         image: FileImage(controller.video.value!),
                                //         fit: BoxFit.cover,
                                //       )
                                //     :
                                DecorationImage(
                              image: AssetImage(Images.uploadVideo),
                              fit: BoxFit.cover,
                            ),
                            // image: DecorationImage(
                            //     image: AssetImage(Images.uploadVideo),
                            //     fit: BoxFit.cover),
                            border: Border.all(color: Color(0xffE1ECFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),

              SizedBox(
                height: 3.h,
              ),
              Center(
                  child: CommonButton(
                      onTap: () {
                        Get.to(BusinessQueList());
                      },
                      title: 'Save and Continue')),

              SizedBox(
                height: 4.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
