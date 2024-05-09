import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/pages/customer/cutome_Map.dart';
import 'package:ondago/views/pages/worker/workerscreen.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;
import 'package:hexagon/hexagon.dart';

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 45.h,
              ),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.anglecontainer),
                      fit: BoxFit.fill),
                  // color: Color(0xff3A81F7),
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(100),
                  //     bottomRight: Radius.circular(100))
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                bottom: 0,
                child: HexagonWidget.pointy(
                    width: 120,
                    //color: Colors.red,
                    elevation: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Images.me), fit: BoxFit.cover)),
                    )
                    //  Image.asset(Images.me),
                    ),
              ),
              Positioned(
                top: 16.h,
                right: 130,
                left: 130,
                child: GestureDetector(
                  onTap: () {},
                  child: TextCustom(
                    text: 'congratulation!',
                    size: 16,
                    col: Colors.white,
                    weight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TextCustom(
            text: 'Kaylynn Schleifer ',
            col: Color(0xff282773),
            size: 16,
            weight: FontWeight.w600,
          ),
          TextCustom(
            text: 'Customer',
            size: 16,
            col: Color(0xff8590B6),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: 220,
            //  color: Colors.amber,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'kaylynn ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff282773),
                      )),
                  TextSpan(
                      text:
                          ' wants to work with you. Click on the continue button to go to the navigation page.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff8590B6),
                      ))
                ])),
          ),
          SizedBox(
            height: 12.h,
          ),
          CommonButton(
              onTap: () {
                Get.to(CustomerMapPage());
              },
              title: 'Continue')
        ],
      ),
    );
  }
}
