import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Worker_Controller/Activity_Worker_controller.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkerAllListScreen extends StatelessWidget {
  final controller = Get.put(ActivityWorkerController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: index == 0
                ? CustamContainer(
                    wigth: double.infinity,
                    cir: 10,
                    col: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
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
                  )
                : index == 1
                    ? CustamContainer(
                        wigth: double.infinity,
                        cir: 10,
                        col: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                      )
                    : CustamContainer(
                        wigth: double.infinity,
                        cir: 10,
                        col: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextCustom(
                                    text: controller.payments[index],
                                    size: 16,
                                    weight: FontWeight.w600,
                                    col: Color(0xff282773),
                                  ),
                                  TextCustom(
                                      text: '-56',
                                      size: 16,
                                      weight: FontWeight.w600,
                                      col: Colors.red),
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
