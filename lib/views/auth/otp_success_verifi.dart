import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';

class SuccessOtpVerification extends StatelessWidget {
  const SuccessOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(Images.SUCCESS)),
          TextCustom(
            text: 'Your Phone is verified successfully ',
            size: 15,
            weight: FontWeight.w600,
            col: Color(0xff8590B6),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(onTap: () {}, title: 'Continue'),
          ],
        ),
      ),
    );
  }
}
