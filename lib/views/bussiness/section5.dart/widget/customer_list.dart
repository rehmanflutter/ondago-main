import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4, // cont.getworkersList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustamContainer(
                          hight: 26,
                          wigth: 75,
                          cir: 6,
                          col: Color(0xff3A81F7),
                          child: TextCustom(
                            text: 'Accept',
                            col: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustamContainer(
                          hight: 26,
                          wigth: 75,
                          cir: 6,
                          col: Color(0xffFF0F00),
                          child: TextCustom(
                            text: 'Cancel',
                            col: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SlidableAction(
                  //   onPressed: doNothing,
                  //   backgroundColor: Color(0xFF0392CF),
                  //   foregroundColor: Colors.white,
                  //   icon: Icons.save,
                  //   label: 'Save',
                  // ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  //  ShowBottomSheet();
                },
                child: Container(
                  width: Get.width,
                  // height: Adaptive.px(91),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                            radius: 30, backgroundImage: AssetImage(Images.me)
                            //   NetworkImage(workerModel.imageUrl!),
                            ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width * 0.420,
                                  // color: Colors.amber,
                                  child: Text(
                                    'Rachel Sinclair',
                                    //  workerModel.userName!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff282773),
                                    ),
                                  ),
                                ),
                                Text(
                                  '11 minutesAway',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff80A7EB),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              //  color: Colors.amber,
                              width: Get.width * 0.66,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rating',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff282773),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            // workerModel.rating!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff80A7EB),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(
                                            Icons.star_outline,
                                            size: 15,
                                            color: Color(0xff80A7EB),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Get.height * 0.05,
                                    width: 1,
                                    color: const Color(0xff80A7EB),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pricing',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff282773),
                                        ),
                                      ),
                                      Text(
                                        '\$50',
                                        //   workerModel.price!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff80A7EB),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Get.height * 0.05,
                                    width: 1,
                                    color: const Color(0xff80A7EB),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Status',
                                        //workerModel.time!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff282773),
                                        ),
                                      ),
                                      Text(
                                        'Enrroute',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff80A7EB),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5.h,
                                ),
                                SvgPicture.asset(
                                  Images.chats,
                                  color: Color(0xff282773),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextCustom(
                                  text: 'message customer',
                                  size: 10,
                                  weight: FontWeight.w500,
                                  col: Color(0xff80A7EB),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  Images.phonecall,
                                  color: Color(0xff282773),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                TextCustom(
                                  text: 'Call Customer',
                                  size: 10,
                                  weight: FontWeight.w500,
                                  col: Color(0xff80A7EB),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
