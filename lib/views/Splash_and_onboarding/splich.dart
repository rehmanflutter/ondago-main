import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/Splash_and_onboarding/onboarding.dart';
import 'package:ondago/views/widgets/utils/images.dart';

class SplichScreen extends StatefulWidget {
  const SplichScreen({super.key});

  @override
  State<SplichScreen> createState() => _SplichScreenState();
}

class _SplichScreenState extends State<SplichScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  height: 210, width: 210, child: Image.asset(Images.appicon))),
          Image.asset(Images.ONDAGO),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

// class CustomShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 15;

//     var path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width, 0);

//     path.lineTo(size.width, size.height * 0.8);
//     path.lineTo(size.width * 0.5, size.height);
//     path.lineTo(0, size.height * 0.8);
//     path.lineTo(0, 0);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomShapePainter oldDelegate) {
//     return false;
//   }
// }
//  CustomPaint(
//             size: Size(MediaQuery.of(context).size.width, 300),
//             painter: CustomShapePainter(),
//           ),