import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/Bussiness_Controller/Section_3_4_Controller/section_5_Controller/admin_controller.dart';
import 'package:ondago/controllers/worker_controller.dart';
import 'package:ondago/views/bussiness/section5.dart/bussines_home2.dart';
import 'package:ondago/views/pages/customer/Customer_screen.dart';
import 'package:ondago/views/bussiness/section5.dart/widget/customer_list.dart';
import 'package:ondago/views/bussiness/section5.dart/widget/worker_list.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdminScreenList extends StatefulWidget {
  @override
  State<AdminScreenList> createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<AdminScreenList> {
  final controller = Get.put(AdmainController());

  // CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FE),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 30, backgroundImage: AssetImage(Images.me)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: GoogleFonts.poppins(
                            color: Color(0xff282773),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Business Name",
                        //  cont.getCustomer.userName!,
                        style: GoogleFonts.poppins(
                            color: Color(0xff282773),
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Images.notification)),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Divider(
                color: Color(0xffE1ECFF),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  TextCustom(
                    text: 'Filter',
                    size: 15,
                    weight: FontWeight.w600,
                    col: Color(0xff282773),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/BusinessFilterScreen');
                      },
                      child: SvgPicture.asset(Images.filter)),
                  SizedBox(
                    width: 3.h,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.worker.value = true;
                      },
                      child: CustamContainer(
                        hight: 4.5.h,
                        wigth: 15.h,
                        cir: 7,
                        borders: true,
                        col: controller.worker.value == true
                            ? Color(0xff3A81F7)
                            : Colors.transparent,
                        bordercol: Color(0xff80A7EB),
                        child: TextCustom(
                          text: 'customer',
                          col: controller.worker.value == true
                              ? Colors.white
                              : Color(0xff282773),
                          size: 3.5.w,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.worker.value = false;
                      },
                      child: CustamContainer(
                        hight: 4.5.h,
                        wigth: 15.h,
                        cir: 7,
                        col: controller.worker.value == false
                            ? Color(0xff3A81F7)
                            : Colors.transparent,
                        borders: true,
                        bordercol: Color(0xff80A7EB),
                        child: TextCustom(
                          text: 'Worker',
                          size: 3.5.w,
                          col: controller.worker.value == false
                              ? Colors.white
                              : Color(0xff282773),
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => controller.worker.value == true
                  ? CustomerList()
                  : WorkerList())
            ],
          ),
        ),
      ),
    );
  }

//
////
//////
  ///       bottom sheet
  ///
  ///
  ///
  void ShowBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Adaptive.px(370),
          width: Get.width,
          decoration: const BoxDecoration(
            color: Color(0xFF3A81F7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.0),
              topRight: Radius.circular(26.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 1.5,
                    width: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Container(
                    height: 1.5,
                    width: 35,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Images.me),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: 'Kaylynn Schleifer',
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingBar.builder(
                          glowColor: Colors.yellow,
                          // unratedColor: Colors.transparent,

                          initialRating: 10.9,
                          // double.parse(
                          //  ),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        // itemCount: workerController
                        //     .getreviewsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(Images.me),
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width * 0.4,
                                              // color: Colors
                                              //     .amber,
                                              child: Text(
                                                'Excellent! wonderful work!',
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 10.9,
                                              // double.parse(
                                              //  ),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 14,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TextCustom(
                                              text: 'ChildCare',
                                              size: 9,
                                              col: Colors.white,
                                            ),
                                            TextCustom(
                                              text: '\$50',
                                              size: 9,
                                              col: Colors.white,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),

//  3nd

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        RatingBar.builder(
                                          glowColor: Colors.white,
                                          // unratedColor: Colors.transparent,

                                          initialRating: 10.9,
                                          // double.parse(
                                          //  ),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 14,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        Container(
                                          width: 150,
                                          //  color: Colors
                                          //   .amber,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: TextCustom(
                                              text:
                                                  'she was a Good Client I love to wok in the Future',
                                              size: 9,
                                              col: Colors.white,
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage(Images.me),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })),

                // me

                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ))),
                      onPressed: () {
                        Get.to(CustomerScreen());

                        ///  Get.to(MapPage());
                      },
                      child: Text(
                        'Start Work',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff3A81F7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// class BottomHeader extends StatelessWidget {
//   const BottomHeader({
//     super.key,
//     required this.workerModel,
//   });

//   final WorkerModel workerModel;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundImage: NetworkImage(workerModel.imageUrl!),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 workerModel.userName!,
//                 style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600),
//               ),
//               RatingBar.builder(
//                 initialRating: double.parse(workerModel.rating!),
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: false,
//                 itemSize: 22,
//                 ignoreGestures: true,
//                 itemCount: 5,
//                 itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
