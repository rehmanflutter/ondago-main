import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Bussiness_Controller/AllActivity_Controller/activity_controller.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentsList extends StatelessWidget {
  final controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.payments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustamContainer(
              wigth: double.infinity,
              cir: 10,
              col: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(
                          text: controller.payments[index],
                          size: 16,
                          weight: FontWeight.w600,
                          col: Color(0xff282773),
                        ),
                        TextCustom(
                            text: '${controller.paymentPrice[index]}',
                            size: 16,
                            weight: FontWeight.w600,
                            col: controller.paymentPrice[index] > 0
                                ? Color(0xff009406)
                                : Colors.red)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextCustom(
                        text:
                            'You hired rachel consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis quis. ',
                        size: 12,
                        col: Color(0xff8590B6),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextCustom(
                        text: '12/02/2024  04:30PM',
                        col: Color(0xff80A7EB),
                        size: 10,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
