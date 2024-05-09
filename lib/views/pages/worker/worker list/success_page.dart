import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/pages/customer/payment/payment_details_page.dart';
import 'package:ondago/views/widgets/common_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/Frame 1000002156.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CommonButton(
                onTap: () => Get.to(() => PaymentDetailsPage()),
                title: 'Continue'),
            SizedBox(height: Get.height * 0.1),
          ],
        ),
      ),
    );
  }
}
