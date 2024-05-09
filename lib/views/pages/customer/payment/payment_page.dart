import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndialog/ndialog.dart';
import 'package:ondago/views/pages/customer/Custom_payment.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isMaster = false;
  bool isApple = false;
  bool isPay = false;
  bool isVisa = false;
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
          'Payment',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment method',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMaster = true;
                              isApple = false;
                              isPay = false;
                              isVisa = false;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff343434),
                                  ),
                                ),
                                child: isMaster
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff3A81F7),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              const SizedBox(width: 5),
                              Image.asset('assets/icons/mater.png'),
                              const SizedBox(width: 5),
                              Text(
                                'Master card',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff343434)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMaster = false;
                              isApple = true;
                              isPay = false;
                              isVisa = false;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff343434),
                                  ),
                                ),
                                child: isApple
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff3A81F7),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              const SizedBox(width: 5),
                              Image.asset('assets/icons/apple.png'),
                              const SizedBox(width: 5),
                              Text(
                                'Apple Pay',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff343434)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    ///second
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMaster = false;
                              isApple = false;
                              isPay = true;
                              isVisa = false;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff343434),
                                  ),
                                ),
                                child: isPay
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff3A81F7),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              const SizedBox(width: 5),
                              Image.asset('assets/icons/paypal.png'),
                              const SizedBox(width: 5),
                              Text(
                                'Paypal',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff343434)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMaster = false;
                              isApple = false;
                              isPay = false;
                              isVisa = true;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff343434),
                                  ),
                                ),
                                child: isVisa
                                    ? Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff3A81F7),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              const SizedBox(width: 5),
                              Image.asset('assets/icons/visa.png'),
                              const SizedBox(width: 5),
                              Text(
                                'Visa Card',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff343434)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Image.asset(
                      'assets/icons/card.png',
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff80A7EB), fontSize: 12),
                        ),
                        Text(
                          '\$120.0',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Divider(color: const Color(0xff888888).withOpacity(.2)),

                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff80A7EB), fontSize: 12),
                        ),
                        Text(
                          'Card',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Divider(color: const Color(0xff888888).withOpacity(.2)),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ID',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff80A7EB), fontSize: 12),
                        ),
                        Text(
                          '123456',
                          style: GoogleFonts.poppins(
                              color: const Color(0xff282773),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Divider(color: const Color(0xff888888).withOpacity(.2)),
                    SizedBox(height: Get.height * 0.02),
                    Container(
                      width: Get.width,
                      height: Adaptive.px(100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: const Color(0xffE1ECFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText:
                                'Enter the description of the service you purchase',
                            hintStyle: GoogleFonts.poppins(
                                color: const Color(0xff282773), fontSize: 10),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CommonButton(
                        onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return dialog widget
                                return AlertDialog(
                                  title: Image.asset(
                                    'assets/icons/pop.png',
                                    height: 130,
                                    width: 130,
                                  ),
                                  content: Text(
                                    'payment has been confirmed\nsuccessfully',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff282773),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  actions: [
                                    CommonButton(
                                        onTap: () {
                                          Get.to(CustomerPayment());
                                        },
                                        title: 'Continue')
                                  ],
                                  actionsAlignment: MainAxisAlignment.center,
                                );
                              },
                            ),
                        title: 'Confirm Payment'),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
