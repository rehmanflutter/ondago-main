import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/controllers/worker_controller.dart';
import 'package:ondago/views/pages/customer/Custom_payment.dart';
import 'package:ondago/views/pages/worker/worker%20list/map_screen.dart';
import 'package:ondago/views/pages/customer/Customer_screen.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerWorkerListPage extends StatefulWidget {
  const CustomerWorkerListPage({super.key});

  @override
  State<CustomerWorkerListPage> createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<CustomerWorkerListPage> {
  WorkerController workerController = Get.put(WorkerController());

  @override
  void initState() {
    //  workerController.getAllWorkersList();
    // TODO: implement initState
    super.initState();
  }

  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FE),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F5FE),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            Get.to(MapPage());
          },
          child: Text(
            'Worker List',
            style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Get.to(CustomerPayment());
                },
                child: Image.asset('assets/icons/filter.png')),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Total ',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff6D80C5),
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: '5', //cont.getworkersList.length.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: 'active Workers ',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff6D80C5),
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.03),
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

                          ShowBottomSheet();
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
                                    backgroundImage: AssetImage(Images.me)
                                    //   NetworkImage(workerModel.imageUrl!),
                                    ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rachel Sinclair',
                                      //  workerModel.userName!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff282773),
                                      ),
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
                        print('id is ${customerController.workerId}');
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
