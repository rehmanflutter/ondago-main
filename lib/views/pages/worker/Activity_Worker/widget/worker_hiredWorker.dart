import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Worker_Controller/Activity_Worker_controller.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkerHiredWorker extends StatelessWidget {
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Images.me2),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 69.w,
                          //    color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 21.h,
                                //  color: Colors.amber,
                                child: TextCustom(
                                  text: 'Rachel Sinclair',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  col: Color(0xff282773),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextCustom(
                                text: controller.HiredWorker[index],
                                col: Color(0xff80A7EB),
                                size: 10,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70.w,
                          //   color: Colors.amber,
                          child: TextCustom(
                            text:
                                'You hired rachel consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis Quis.  ',
                            size: 3.w,
                            col: Color(0xff8590B6),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextCustom(
                              text: '1day 04:30PM',
                              col: Color(0xff80A7EB),
                              size: 10,
                              weight: FontWeight.w500,
                            ),
                          ],
                        )
                      ],
                    ),
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
