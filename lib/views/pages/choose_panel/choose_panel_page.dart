import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/auth/sign_in.dart';
import 'package:ondago/views/pages/customer/bnb/bnb_page.dart';
import 'package:ondago/views/pages/worker/worker%20bnb/worker_bnb_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChoosePanelPage extends StatelessWidget {
  const ChoosePanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/gashtiya.png',
              fit: BoxFit.cover,
              width: Get.width,
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/shape.png',
                fit: BoxFit.cover,
                width: Get.width,
                height: Get.height * 0.6,
              ),
            ),
            Positioned(
              top: Get.height * 0.45,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Choose the Role which suits you\nthe best',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: Adaptive.sp(18),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Adaptive.px(15)),
                  CommonButton1(
                    onPressed: () => Get.offAll(() => BnbPage()),
                    title: 'Customer',
                  ),
                  SizedBox(height: Adaptive.px(15)),
                  CommonButton1(
                    onPressed: () => Get.offAll(() => WorkerBnbPage()),
                    title: 'Worker',
                  ),
                  SizedBox(height: Adaptive.px(15)),
                  CommonButton1(
                    onPressed: () {
                      // Get.offAll(() => SigninScreen());
                    },
                    title: 'Business',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonButton1 extends StatelessWidget {
  const CommonButton1({
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
                const Color(0xff061E37),
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
