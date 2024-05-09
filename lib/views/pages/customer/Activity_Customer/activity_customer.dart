import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/Customer_Controller/cusactivity_controller.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/widget/customer_AllListScreen.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/widget/customer_HiredWord.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/widget/customer_jop_list.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/widget/customer_payment.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActivityCustomer extends StatelessWidget {
  final controller = Get.put(CustomerActivityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5FE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: AssetImage(Images.me2)),
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
                      "Customer Name",
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
            SizedBox(
              height: 2.h,
            ),
            Divider(),
            SizedBox(
              height: 2.h,
            ),
            // Obx(
            //   () => Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       ActivitySelect(
            //         title: 'All',
            //         selectIndex: controller.selectActivity.value,
            //         index: 0,
            //         fun: () {
            //           controller.selectActivity.value = 0;
            //         },
            //       ),
            //       ActivitySelect(
            //         title: 'Job post',
            //         selectIndex: controller.selectActivity.value,
            //         index: 1,
            //         fun: () {
            //           controller.selectActivity.value = 1;
            //         },
            //       ),
            //       ActivitySelect(
            //         title: 'hired Worker',
            //         selectIndex: controller.selectActivity.value,
            //         index: 2,
            //         fun: () {
            //           controller.selectActivity.value = 2;
            //         },
            //       ),
            //       ActivitySelect(
            //         title: 'Payments',
            //         selectIndex: controller.selectActivity.value,
            //         index: 3,
            //         fun: () {
            //           controller.selectActivity.value = 3;
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Obx(() => controller.selectActivity.value == 1
            //     ? CustomerJopPostList()
            //     : controller.selectActivity.value == 2
            //         ? CustomerHiredWorker()
            //         : controller.selectActivity.value == 3
            //             ? CustomerPaymentsList()
            //             : CustomerAllListScreen())
          ],
        ),
      ),
    );
  }
}

class ActivitySelect extends StatelessWidget {
  String title;
  int selectIndex;
  int index;
  VoidCallback fun;
  ActivitySelect(
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
          hight: 4.5.h,
          cir: 5,
          col: selectIndex == index ? Color(0xff3A81F7) : Color(0xffE1ECFF),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
            ),
            child: TextCustom(
                text: title,
                size: 3.3.w,
                weight: FontWeight.w500,
                col: selectIndex == index
                    ? Color(0xffE1ECFF)
                    : Color(0xff282773)),
          ),
        ),
      ),
    );
  }
}
