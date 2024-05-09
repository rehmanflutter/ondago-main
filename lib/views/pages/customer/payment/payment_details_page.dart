import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/views/pages/customer/payment/payment_page.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentDetailsPage extends StatelessWidget {
  PaymentDetailsPage({super.key});
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController bankCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Delivery Details',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xff282773),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Info',
                style: GoogleFonts.poppins(
                    color: const Color(0xff282773),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.02),
                    CommonField(
                      controller: nameCtrl,
                      hintText: 'Full Name',
                      prefixIcon: 'assets/icons/uprofile.png',
                      onChanged: (value) {},
                      validator: (value) {
                        return '';
                      },
                    ),
                    const SizedBox(height: 10),
                    CommonField(
                        hintText: 'Address',
                        controller: addressCtrl,
                        prefixIcon: 'assets/icons/mlocation.png',
                        onChanged: (value) {},
                        validator: (value) {
                          return '';
                        }),
                    const SizedBox(height: 10),
                    CommonField(
                      controller: phoneCtrl,
                      hintText: 'Enter Your Phone Number',
                      prefixIcon: 'assets/icons/uphone.png',
                      onChanged: (value) {},
                      validator: (value) {
                        return '';
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Bank Detail',
                style: GoogleFonts.poppins(
                    color: const Color(0xff282773),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                height: Adaptive.px(97),
                width: Get.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonField(
                        hintText: 'Account number',
                        controller: bankCtrl,
                        prefixIcon: 'assets/icons/bank.png',
                        onChanged: (value) {},
                        validator: (value) {
                          return '';
                        })
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                    width: Get.width * 0.6,
                    child: CommonButton(
                        onTap: () => Get.to(() => PaymentPage()),
                        title: 'Continue to Payment')),
              ),
              SizedBox(height: Get.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
