import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/bussiness/bussines_App_bar.dart';
import 'package:ondago/views/pages/customer/home/home_page.dart';
import 'package:ondago/views/pages/worker/Activity_Worker/worker_Activity.dart';
import 'package:ondago/views/pages/worker/worker_home_page.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: use_key_in_widget_constructors
class ShooseSuitsYouBest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //  Image.asset(Images.containercie)
          Stack(
            children: [
              Container(
                height: 50.h,
              ),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.containercie), fit: BoxFit.fill),
                  // color: Color(0xff3A81F7),
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(100),
                  //     bottomRight: Radius.circular(100))
                ),
              ),
              Positioned(
                left: 70,
                right: 70,
                bottom: 0,
                child: Container(
                  height: 40.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      image: const DecorationImage(
                          image: AssetImage(Images.rectang), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 50.h,
            // color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextCustom(
                    align: TextAlign.center,
                    text: 'Choose the Role which suits you the best',
                    size: 2.8.h,
                    weight: FontWeight.w400,
                    col: const Color(0xff282773),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CommonButtono1(
                    onPressed: () {
                      Get.to(() =>
                          CustomerHomePage()); // ActivityCustomer()); // WorkerListPage());
                    },
                    title: 'Customer',
                  ),
                  SizedBox(height: Adaptive.px(15)),
                  CommonButtono1(
                    onPressed: () {
                      Get.to(() => WorkerHomePage()); //
                    },
                    title: 'Worker',
                  ),
                  SizedBox(height: Adaptive.px(15)),
                  CommonButtono1(
                    onPressed: () {
                      Get.to(() => BusinessBottomAppBar() ////SigninScreen()
                          );
                    },
                    title: 'Business',
                  ),
                ],
              ),
            ),
          ),

          /////
          ///
          ///
          ///
          ///
        ],
      ),
    );
  }
}

class CommonButtono1 extends StatelessWidget {
  const CommonButtono1({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.px(351),
      height: Adaptive.px(58),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff3A81F7),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: Adaptive.sp(16),
                fontWeight: FontWeight.w700),
          )),
    );
  }
}
