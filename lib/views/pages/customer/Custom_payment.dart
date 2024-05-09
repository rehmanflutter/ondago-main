import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexagon/hexagon.dart';
import 'package:ondago/views/pages/customer/feedback_page.dart';
import 'package:ondago/views/pages/worker/worker_payment.dart';
import 'package:ondago/views/pages/worker/workerscreen.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;

class CustomerPayment extends StatelessWidget {
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
              // CustomPaint(
              //   size: Size(MediaQuery.of(context).size.width, 300),
              //   painter: CustomShapePainter(),
              // ),
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
                right: 125,
                left: 125,
                child: GestureDetector(
                  onTap: () {},
                  child: TextCustom(
                    text: 'Payment Done!',
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
          Text('\$50',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Color(0xff282773),
              )),
          Text('received',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff282773),
              )),
          SizedBox(
            height: 12.h,
          ),
          CommonButton(
              onTap: () {
                Get.to(CustomerFeedbackPage());
              },
              title: 'Continue')
        ],
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 15;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) {
    return false;
  }
}
