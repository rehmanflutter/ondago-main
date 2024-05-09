import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ondago/controllers/customers_controller.dart';
import 'package:ondago/models/customer_model.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkerEditProfilePage extends StatefulWidget {
  // const CustomerEditProfilePage({super.key, required this.customerModel});

  //final CustomerModel customerModel;

  @override
  State<WorkerEditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<WorkerEditProfilePage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController mailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  //CustomerController customerController = Get.put(CustomerController());
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
    // nameCtrl.text = widget.customerModel.userName!;
    // mailCtrl.text = widget.customerModel.email!;

    // phoneCtrl.text = widget.customerModel.phoneNumber!;

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
          'Edit Profile',
          style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  image != null
                      ? GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: const Color(0xff242424),
                              backgroundImage: FileImage(image!),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Color(0xff242424),
                            // backgroundImage:
                            //  NetworkImage(widget.customerModel.imageUrl!),
                          )),
                  Positioned(
                    bottom: Adaptive.px(25),
                    right: Adaptive.px(30),
                    child: GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.camera);
                        },
                        child: Image.asset('assets/icons/camera.png')),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'Linda Steves',
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
                            controller: mailCtrl,
                            hintText: 'Enter your Email Address',
                            prefixIcon: 'assets/icons/umail.png',
                            onChanged: (value) {},
                            validator: (value) {
                              return '';
                            },
                          ),
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CommonButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'Save Changes',
            ),
            SizedBox(height: Get.height * 0.06),
          ],
        ),
      ),
    );
  }
}
