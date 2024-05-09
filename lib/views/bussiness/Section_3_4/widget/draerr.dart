import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/bussiness/Activity/all_activity.dart';
import 'package:ondago/views/bussiness/Section_3_4/Profile/profile.dart';
import 'package:ondago/views/bussiness/section5.dart/admins.dart';
import 'package:ondago/views/bussiness/section5.dart/business_payment_screen.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//  Abdul Rehman Flutter Developer

// instagram  ID : rehmanflutter

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff3A81F7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: AssetImage(Images.me)),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Business Name",
                      //  cont.getCustomer.userName!,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Business',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Divider(),
            SizedBox(
              height: 4.h,
            ),
            DrawerCustamcon(
              data: 'Profile',
              icons: SvgPicture.asset(Images.imagpersons),
              fun: () {
                Get.to(ProfileScreens());
              },
            ),
            DrawerCustamcon(
              data: 'Admin',
              icons: SvgPicture.asset(Images.divider1),
              fun: () {
                Get.to(AdminScreenList());
              },
            ),
            DrawerCustamcon(
              data: 'Payment',
              icons: SvgPicture.asset(Images.driver3),
              fun: () {
                Get.to(BusinessPaymentScreen());
              },
            ),
            DrawerCustamcon(
              data: 'Setting',
              icons: SvgPicture.asset(Images.setting),
              fun: () {
                Get.to(AllActivity());
              },
            ),
            Expanded(child: SizedBox()),
            Divider(
              height: 20,
            ),
            DrawerCustamcon(
              data: 'Log Out',
              icons: SvgPicture.asset(Images.logout),
              fun: () {},
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerCustamcon extends StatelessWidget {
  final String data;
  final Widget icons;
  final VoidCallback fun;
  DrawerCustamcon({required this.data, required this.icons, required this.fun});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: fun,
          child: CustamContainer(
              hight: 49,
              cir: 5,
              child: Row(
                children: [
                  SizedBox(
                    width: 19,
                  ),
                  icons,
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    data,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    //ht: FontWeight.w500,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
