import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/models/care_model.dart';
import 'package:ondago/models/find_model.dart';
import 'package:ondago/models/manage_model.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/activity_customer.dart';
import 'package:ondago/views/pages/customer/detail/home_detail_page.dart';
import 'package:ondago/views/pages/customer/profile/profile_page.dart';
import 'package:ondago/views/widgets/search_field.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerHomePage extends StatefulWidget {
  CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<CustomerHomePage> {
  final TextEditingController searchCtrl = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  CustomerController customerController = Get.put(CustomerController());

  @override
  void initState() {
    customerController.getCustomerInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 4,
        backgroundColor: const Color(0xff3A81F7),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 30, backgroundImage: AssetImage(Images.me2)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ibrahim',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Customer',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            RowData(
              onTap: () => Get.to(() => const CustomerProfilePage()),
              image: SvgPicture.asset(
                Images.profile,
                color: Colors.white,
              ),
              title: 'Profile',
            ),
            SizedBox(height: Get.height * 0.04),
            RowData(
              onTap: () {
                Get.to(ActivityCustomer());
              },
              image: SvgPicture.asset(Images.driver3),
              title: 'Payment',
            ),
            SizedBox(height: Get.height * 0.04),
            RowData(
              onTap: () {},
              image: SvgPicture.asset(Images.setting),
              title: 'Settings',
            ),
            SizedBox(height: Get.height * 0.4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: const Divider(color: Colors.white),
            ),
            SizedBox(height: Get.height * 0.02),
            RowData(
              onTap: () {},
              image: SvgPicture.asset(Images.logout),
              title: 'Log Out',
            ),
          ],
        ),
      ),
      key: _key,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetX<CustomerController>(
                        init: Get.put(CustomerController()),
                        builder: (cont) {
                          return cont.getCustomer.email == null
                              ? CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: () => _key.currentState!.openDrawer(),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        cont.getCustomer.imageUrl!),
                                  ),
                                );
                        }),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: Adaptive.px(17),
                              fontWeight: FontWeight.w400),
                        ),
                        GetX<CustomerController>(
                            init: Get.put(CustomerController()),
                            builder: (cont) {
                              return cont.getCustomer.email == null
                                  ? SizedBox()
                                  : Text(
                                      cont.getCustomer.userName!,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff282773),
                                          fontSize: Adaptive.px(17),
                                          fontWeight: FontWeight.bold),
                                    );
                            }),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/notification.png'),
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.h(2)),
                Text(
                  'Select the service Here',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: Adaptive.h(1)),
                SearchField(searchCtrl: searchCtrl),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Adaptive.h(2)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                        child: Text(
                          'Care Services',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            careList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(20), vertical: 5),
                              child: GestureDetector(
                                onTap: () =>
                                    Get.to(() => const HomeDetailPage()),
                                child: Container(
                                  width: Adaptive.px(83),
                                  height: Adaptive.px(98),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(.05),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(careList[index].image),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Text(
                                        careList[index].title,
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xff282773),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                        child: Text(
                          'Manage Your Appearance',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            manageList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(20), vertical: 5),
                              child: Container(
                                width: Adaptive.px(83),
                                height: Adaptive.px(98),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(manageList[index].image),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      manageList[index].title,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff282773),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                        child: Text(
                          'Get help with home chores maintenance and Yard work',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            findList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(20), vertical: 5),
                              child: Container(
                                width: Adaptive.px(83),
                                height: Adaptive.px(98),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(findList[index].image),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      findList[index].title,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff282773),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                        child: Text(
                          'Pros for all Your Emergency Solutions',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(1)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            careList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(20), vertical: 5),
                              child: Container(
                                width: Adaptive.px(83),
                                height: Adaptive.px(98),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(careList[index].image),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      careList[index].title,
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff282773),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final Widget image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            image,
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
