import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/views/pages/customer/profile/edit_profile_page.dart';
import 'package:ondago/views/pages/worker/worker%20list/profile/edit_profile_worker.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/utils/images.dart';

class WorkerProfilePage extends StatelessWidget {
  const WorkerProfilePage({super.key});

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
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.02),
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    Images.me2) //NetworkImage(cont.getCustomer.imageUrl!),
                ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Ibrahim',
              style: GoogleFonts.poppins(
                  color: const Color(0xff282773),
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: Get.height * 0.05),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff282773),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            children: [
                              //SvgPicture.asset(Images.calls),
                              Image.asset('assets/icons/name.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Ibrahim',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            children: [
                              SvgPicture.asset(Images.bank2),
                              const SizedBox(width: 20),
                              Text(
                                'Email',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            children: [
                              SvgPicture.asset(Images.emailbank),
                              const SizedBox(width: 20),
                              Text(
                                'Phone No',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CommonButton(
              onTap: () => Get.to(() => WorkerEditProfilePage()),
              title: 'Edit Profile',
            ),
            SizedBox(height: Get.height * 0.06),
          ],
        ),
      ),
    );
  }
}
