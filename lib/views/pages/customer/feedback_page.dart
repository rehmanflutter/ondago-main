import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/views/pages/worker/worker%20list/success_page.dart';
import 'package:ondago/views/pages/worker/worker%20list/worker_list_page.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerFeedbackPage extends StatefulWidget {
  const CustomerFeedbackPage({super.key});

  @override
  State<CustomerFeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<CustomerFeedbackPage> {
  CustomerController customerController = Get.put(CustomerController());

  double totalating = 3.0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FE),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F5FE),
        leading: IconButton(
          onPressed: () => Get.to(() => const CustomerWorkerListPage()),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Work Completed',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xff282773),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '24 mar 2024, 3:22 PM',
                style: GoogleFonts.poppins(
                    color: const Color(0xff282773).withOpacity(.79),
                    fontSize: 14),
              ),
              Text(
                'we’re happy to be of service!',
                style: GoogleFonts.poppins(
                    color: const Color(0xff80A7EB), fontSize: 14),
              ),
              SizedBox(height: Get.height * 0.04),
              GestureDetector(
                  onTap: () {}, child: Image.asset('assets/icons/help.png')),
              Text(
                'Help',
                style: GoogleFonts.poppins(
                    color: const Color(0xff282773).withOpacity(.79),
                    fontSize: 14),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height * 0.5,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: Adaptive.px(340),
                      width: Get.width,
                      //  color: Colors.amber,
                    ),
                    Container(
                      height: Adaptive.px(307),
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.25),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Review',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff282773),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Image.asset('assets/icons/edit.png'),
                                const SizedBox(width: 10),
                                Text(
                                  'edit',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xff282773),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xff282773),
                              ),
                              onRatingUpdate: (rating) {
                                totalating = rating;
                              },
                            ),
                            const SizedBox(height: 10),
                            Text('Very good',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff80A7EB),
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Feedback',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Container(
                              width: Get.width,
                              height: Adaptive.px(82),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: const Color(0xffE1ECFF),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: textEditingController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'write your Feedback here',
                                    hintStyle: GoogleFonts.poppins(
                                        color: const Color(0xff282773),
                                        fontSize: 10),
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/linda.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CommonButton(
                  onTap: () {
                    if (customerController.workerId.isEmpty) {
                      Get.to(SuccessPage());
                    } else {
                      customerController.giveFeedBack(
                          totalating.toString(), textEditingController.text);
                    }
                  },
                  title: 'Done'),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
