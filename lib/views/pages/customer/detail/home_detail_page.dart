import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/views/pages/customer/detail/components/children_name_and_age.dart';
import 'package:ondago/views/pages/customer/detail/components/description_of_service.dart';
import 'package:ondago/views/pages/customer/detail/components/duration_of_service.dart';
import 'package:ondago/views/pages/customer/detail/components/need_of_service.dart';
import 'package:ondago/views/pages/worker/worker%20list/worker_list_page.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final TextEditingController locCtrl = TextEditingController();

  final TextEditingController diffLocCtrl = TextEditingController();

  final TextEditingController childcareCtrl = TextEditingController();

  final TextEditingController nameCtrl = TextEditingController();

  final TextEditingController ageCtrl = TextEditingController();

  final TextEditingController descriptionCtrl = TextEditingController();

  int selectedIndex = 0;
  int milesIndex = 0;
  bool isnow = false;
  bool isCustomDate = false;
  DateTime? _selectedDate;

  CustomerController customerController = Get.put(CustomerController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

  @override
  void initState() {
    locCtrl.text = 'New York, US';
    // TODO: implement initState
    super.initState();
  }

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
          'Child Care',
          style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 16,
              fontWeight: FontWeight.w700),
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
                  'Select Location',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        CommonField(
                            hintText: 'My Location',
                            controller: locCtrl,
                            prefixIcon: 'assets/icons/mlocation.png',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            }),
                        const SizedBox(height: 10),
                        CommonField(
                            hintText: 'Different Location',
                            controller: diffLocCtrl,
                            prefixIcon: 'assets/icons/diff.png',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            }),
                        const SizedBox(height: 10),
                        CommonField(
                            hintText: 'Childcare Location',
                            controller: childcareCtrl,
                            prefixIcon: 'assets/icons/childcare.png',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            }),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Search Radius',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff282773),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    resultTab('Miles', 0),
                    const SizedBox(width: 10),
                    resultTab('minutes', 1),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: Adaptive.px(130),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 20,
                          children: [
                            mileTab(
                                selectedIndex == 0 ? '2 miles' : '2 minutes',
                                0),
                            mileTab(
                                selectedIndex == 0 ? '4 miles' : '4 minutes',
                                1),
                            mileTab(
                                selectedIndex == 0 ? '6 miles' : '6 minutes',
                                2),
                            mileTab(
                                selectedIndex == 0 ? '10 miles' : '10 minutes',
                                3),
                            mileTab(
                                selectedIndex == 0 ? '12 miles' : '12 minutes',
                                4),
                            mileTab(
                                selectedIndex == 0 ? '15 miles' : '15 minutes',
                                5),
                            mileTab(
                                selectedIndex == 0 ? '20 miles' : '20 minutes',
                                6),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'When You need This Service',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  // height: Adaptive.px(130),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isnow = true;
                              isCustomDate = false;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: isnow
                                      ? const Color(0xff3491D3)
                                      : Colors.white,
                                  border: Border.all(
                                    color: const Color(0xff282773),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Now',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isnow = false;
                              isCustomDate = true;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  color: isCustomDate
                                      ? const Color(0xff3491D3)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: const Color(0xff282773),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Choose custom Date and time',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff282773),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        isCustomDate
                            ? NeedOfService(
                                dateTap: () {
                                  _selectDate(context);
                                },
                                selectedDate: _selectedDate,
                                timeTap: () {
                                  _selectTime(context);
                                },
                                selectedTime: _selectedTime)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Duration of Service',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const DurationOfService(),
                const SizedBox(height: 10),
                Text(
                  'Children Name and age',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                ChildrenNameAndAge(nameCtrl: nameCtrl, ageCtrl: ageCtrl),
                const SizedBox(height: 10),
                Text(
                  'Description of service',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                DescriptionOfService(descriptionCtrl: descriptionCtrl),
                const SizedBox(height: 10),
                Text(
                  'Upload Image or Video',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff282773),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  height: Adaptive.px(299),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Adaptive.px(111),
                          width: Get.width,
                          child: DottedBorder(
                            color: const Color(0xffE1ECFF),
                            dashPattern: const [5, 5],
                            strokeWidth: 2,
                            child: image != null
                                ? Image.file(
                                    width: Get.width,
                                    image!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              pickImage(ImageSource.gallery);
                                            },
                                            child: Image.asset(
                                                'assets/icons/image.png')),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Upload Image',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff282773),
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                        //   const SizedBox(height: 20),
                        // SizedBox(
                        //   height: Adaptive.px(111),
                        //   width: Get.width,
                        //   child: DottedBorder(
                        //     color: const Color(0xffE1ECFF),
                        //     dashPattern: const [5, 5],
                        //     strokeWidth: 2,
                        //     child: Center(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Image.asset('assets/icons/video.png'),
                        //           const SizedBox(height: 10),
                        //           Text(
                        //             'Upload Video',
                        //             style: GoogleFonts.poppins(
                        //                 color: const Color(0xff282773),
                        //                 fontSize: 14),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                Center(
                    child: CommonButton(
                        onTap: () {
                          Get.to(() =>
                              CustomerWorkerListPage()); //startLoadingfucn();
                        },
                        title: 'Save and Continue')),
                SizedBox(height: Get.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool startLoading = false;

  startLoadingfucn() {
    customerController.createJob(descriptionCtrl.text);
    setState(() {
      startLoading = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        startLoading = false;

        Get.to(() => CustomerWorkerListPage());
      });
    });
  }

  Widget mileTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          milesIndex = index;
        });
      },
      child: Container(
        width: Adaptive.px(80),
        height: Adaptive.px(27),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: milesIndex == index
              ? const Color(0xff3A81F7)
              : const Color(0xffE1ECFF),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color:
                  index == milesIndex ? Colors.white : const Color(0xff282773),
            ),
          ),
        ),
      ),
    );
  }

  Widget resultTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: Adaptive.px(68),
        height: Adaptive.px(21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              index == selectedIndex ? const Color(0xff3A81F7) : Colors.white,
          border: Border.all(
            color: const Color(0xff3491D3),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: index == selectedIndex
                  ? Colors.white
                  : const Color(0xff282773),
            ),
          ),
        ),
      ),
    );
  }
}
