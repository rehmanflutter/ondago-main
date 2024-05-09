import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/bussiness/businessfilter.dart';
import 'package:ondago/views/pages/customer/Customer_screen.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BusinessQueList extends StatelessWidget {
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

              //
              //
              //

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
                      onTap: () {}, child: SvgPicture.asset(Images.filter)),
                  SizedBox(
                    width: 3.h,
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 4, // cont.getworkersList.length,
                  itemBuilder: (context, index) {
                    //    WorkerModel workerModel = cont.getworkersList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          // workerController
                          //     .getAlreviewsListList(workerModel.userId!);

                          ShowBottomSheet(context);
                        },
                        child: Container(
                          width: Get.width,
                          height: Adaptive.px(91),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(Images.me2)
                                    //   NetworkImage(workerModel.imageUrl!),
                                    ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: Get.width * 0.350,
                                          // color: Colors.amber,
                                          child: Text(
                                            'Center name',
                                            //  workerModel.userName!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff282773),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Message Business  ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff80A7EB),
                                          ),
                                        ),
                                        SvgPicture.asset(Images.chats)
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.64,
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
                                                  color:
                                                      const Color(0xff282773),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '4.5',
                                                    // workerModel.rating!,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xff80A7EB),
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
                                            children: [
                                              Text(
                                                'Pricing',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff282773),
                                                ),
                                              ),
                                              Text(
                                                '\$50',
                                                //   workerModel.price!,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff80A7EB),
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
                                                '11 minutes',
                                                //workerModel.time!,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff80A7EB),
                                                ),
                                              ),
                                              Text(
                                                'Away',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff80A7EB),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
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
              mainAxisSize: MainAxisSize.min,
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
                      backgroundImage: AssetImage(Images.me2),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: 'business Name',
                          size: 16,
                          weight: FontWeight.w600,
                          col: Colors.white,
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
                ListView.builder(
                    itemCount: 1,
                    // itemCount: workerController
                    //     .getreviewsList.length,
                    shrinkWrap: true,
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
                                        Container(
                                          width: Get.width * 0.4,
                                          // color: Colors
                                          //     .amber,
                                          child: Text(
                                            'Excellent! wonderful work!',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    Container(
                                      width: 180,
                                      //  color: Colors
                                      //   .amber,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: TextCustom(
                                          text:
                                              'this business provides really good services. I love to wok in the Future',
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
                    }),

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

                        Get.toNamed('/BusinessPaymentScreen');
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
