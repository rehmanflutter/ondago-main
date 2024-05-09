import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/bussiness/Section_3_4/widget/draerr.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/search_field.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BussinessHomeSreeen extends StatefulWidget {
  @override
  State<BussinessHomeSreeen> createState() => _WorkerHomePageState();
}

class _WorkerHomePageState extends State<BussinessHomeSreeen> {
  final TextEditingController searchCtrl = TextEditingController();
  RxInt selectedIndex = 0.obs; // Default no selection

  // List<String> findWorkers = [
  //   'childcare',
  //   'senior care',
  //   'home & garden',
  //   'pet care',
  //   'health & beauty',
  //   'special care',
  //   'Restaurant & fast food',
  //   'emergency services',
  //   'special request & errand'
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: Color(0xffF2F5FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Row(
                children: [
                  Builder(
                    builder: (BuildContext context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: CircleAvatar(
                          radius: 30, backgroundImage: AssetImage(Images.me2)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
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
                    child: SvgPicture.asset(Images.notification),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Column(
                children: [
                  SearchField(searchCtrl: searchCtrl),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Find Workers ',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff282773),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Color(0xff282773),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //  List Gradi
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            child: Obx(
                              () => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 0;
                                          },
                                          title: 'childcare',
                                          selectIndex: selectedIndex.value,
                                          index: 0),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 1;
                                          },
                                          title: 'senior care',
                                          selectIndex: selectedIndex.value,
                                          index: 1),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 2;
                                          },
                                          title: 'home & garden',
                                          selectIndex: selectedIndex.value,
                                          index: 2),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 3;
                                          },
                                          title: 'pet care',
                                          selectIndex: selectedIndex.value,
                                          index: 3),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 4;
                                          },
                                          title: 'health & beauty',
                                          selectIndex: selectedIndex.value,
                                          index: 4),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 5;
                                          },
                                          title: 'special care',
                                          selectIndex: selectedIndex.value,
                                          index: 5),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 6;
                                          },
                                          title: 'Restaurant & fast food',
                                          selectIndex: selectedIndex.value,
                                          index: 6),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 7;
                                          },
                                          title: 'emergency services',
                                          selectIndex: selectedIndex.value,
                                          index: 7),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      FindWorker(
                                          fun: () {
                                            selectedIndex.value = 8;
                                          },
                                          title: 'special request & errand',
                                          selectIndex: selectedIndex.value,
                                          index: 8),
                                    ],
                                  ),
                                ],
                              ),
                            )
                            //  GridView.builder(
                            //   //  scrollDirection: Axis.horizontal,
                            //   physics: NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //   itemCount: findWorkers
                            //       .length, //snapshot.data!.docs.length,
                            //   itemBuilder: (context, index) {
                            //     return GestureDetector(
                            //       onTap: () {
                            //         selectedIndex.value = index;
                            //       },
                            //       child: Obx(
                            //         () => CustamContainer(
                            //           col: selectedIndex == index
                            //               ? Color(0xff3A81F7)
                            //               : Color(0xffE1ECFF),
                            //           cir: 10,
                            //           child: Center(
                            //             child: TextCustom(
                            //               text: findWorkers[index],
                            //               align: TextAlign.center,
                            //               col: selectedIndex == index
                            //                   ? Colors.white
                            //                   : Color(0xff282773),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //           crossAxisCount:
                            //               3, // Number of items in a row
                            //           mainAxisSpacing:
                            //               10.0, // Spacing along the main axis
                            //           crossAxisSpacing:
                            //               5.0, // Spacing along the cross axis
                            //           mainAxisExtent: 47),
                            // ),

                            ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),

                  //

                  //
                  //End
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustamContainer(
                        wigth: Adaptive.px(155),
                        borders: true,
                        bordercol: Color(0xff282773),
                        hight: Adaptive.px(47),
                        cir: 10,
                        child: TextCustom(
                          text: 'Invisible',
                          weight: FontWeight.w500,
                          col: Color(0xff282773),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                          child: CommonButton(onTap: () {}, title: 'Visible')),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),

                  CustamContainer(
                    col: Colors.white,
                    // height: Get.height * 0.6,
                    wigth: Get.width,
                    cir: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(Images.me),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maria Catherine',
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff282773),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    width: Get.width * 0.550,
                                    // color: Colors.amber,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis quis. Tincidunt egestas at urna pellentesque hendrerit erat proin. Faucibus amet mauris pretium vivamus posuere vitae integer non lectus. Congue massa felis potenti morbi sagittis nec.', //  jobModel.description!,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff282773),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ],
                          ),

                          ////
                          ///
                          ////
                          ///
                          ///
                          ///
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: Adaptive.px(57),
                                width: Adaptive.px(100),
                                decoration: BoxDecoration(
                                  color: const Color(0xffEAEFFE),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Duration',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xff282773),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '5 ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: 'Hours ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            TextSpan(
                                              text: '30 ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: 'Minutes ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: Adaptive.px(57),
                                width: Adaptive.px(100),
                                decoration: BoxDecoration(
                                  color: const Color(0xffEAEFFE),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pay',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xff282773),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '\$50',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: Adaptive.px(57),
                                width: Adaptive.px(100),
                                decoration: BoxDecoration(
                                  color: const Color(0xffEAEFFE),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pay',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xff282773),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            // TextSpan(
                                            //   text: '5 ',
                                            //   style: GoogleFonts.poppins(
                                            //       color: const Color(
                                            //           0xff282773),
                                            //       fontSize: 8,
                                            //       fontWeight:
                                            //           FontWeight
                                            //               .bold),
                                            // ),
                                            TextSpan(
                                              text: '\$50 ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: Adaptive.px(57),
                                width: Adaptive.px(100),
                                decoration: BoxDecoration(
                                  color: const Color(0xffEAEFFE),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Start date',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xff282773),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            // TextSpan(
                                            //   text: '',
                                            //   style: GoogleFonts.poppins(
                                            //       color: const Color(
                                            //           0xff282773),
                                            //       fontSize: 8,
                                            //       fontWeight:
                                            //           FontWeight
                                            //               .bold),
                                            // ),
                                            TextSpan(
                                              text: '20/12/2024 ',
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xff282773),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images.imageicon),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextCustom(
                                    text: 'Watch Video',
                                    size: 10,
                                    weight: FontWeight.w500,
                                    col: Color(0xff3A81F7),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images.imagic),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextCustom(
                                    text: 'View Photo',
                                    size: 10,
                                    weight: FontWeight.w500,
                                    col: Color(0xff3A81F7),
                                  )
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustamContainer(
                                  wigth: Adaptive.px(155),
                                  hight: Adaptive.px(47),
                                  col: Color(0xff3A81F7),
                                  cir: 10,
                                  child: TextCustom(
                                    text: 'Interested',
                                    weight: FontWeight.w500,
                                    size: 12,
                                    col: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustamContainer(
                                  wigth: Adaptive.px(155),
                                  borders: true,
                                  bordercol: Color(0xff282773),
                                  hight: Adaptive.px(47),
                                  cir: 10,
                                  child: TextCustom(
                                    text: 'Not Interested',
                                    weight: FontWeight.w500,
                                    size: 12,
                                    col: Color(0xff282773),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustamContainer(
                                  wigth: Adaptive.px(155),
                                  borders: true,
                                  bordercol: Color(0xff282773),
                                  hight: Adaptive.px(47),
                                  cir: 10,
                                  child: TextCustom(
                                    text: 'More info',
                                    size: 12,
                                    weight: FontWeight.w500,
                                    col: Color(0xff282773),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: Get.height * 0.05),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FindWorker extends StatelessWidget {
  String title;
  int selectIndex;
  int index;
  VoidCallback fun;
  FindWorker(
      {required this.title,
      required this.selectIndex,
      required this.index,
      required this.fun});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: fun,
        child: CustamContainer(
          hight: 5.h,
          cir: 5,
          col: selectIndex == index ? Color(0xff3A81F7) : Color(0xffE1ECFF),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextCustom(
                text: title,
                size: 3.w,
                col: selectIndex == index
                    ? Color(0xffE1ECFF)
                    : Color(0xff3A81F7)),
          ),
        ),
      ),
    );
  }
}
