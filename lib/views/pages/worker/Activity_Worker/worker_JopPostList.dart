import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Worker_Controller/Activity_Worker_controller.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';

class WorkerJopPostList extends StatelessWidget {
  final controller = Get.put(ActivityWorkerController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.JopPost.length,
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
                    TextCustom(
                      text: controller.JopPost[index],
                      size: 16,
                      weight: FontWeight.w600,
                      col: Color(0xff282773),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextCustom(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis quis. ',
                        size: 12,
                        col: Color(0xff8590B6),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextCustom(
                        text: '1day 04:30PM',
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
