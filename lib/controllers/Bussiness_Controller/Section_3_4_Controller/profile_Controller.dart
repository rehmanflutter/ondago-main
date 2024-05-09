import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileControllers extends GetxController {
  final businiessName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final about = TextEditingController();
  List<String> items = [
    'business Category',
    'Childcare ',
    'Senior Care',
    'Pet Care',
    'Health and Beauty',
    'Home And Garden',
    'Restaurant and fast food',
    'Emergency Services',
    'Special Request and Errand'
  ];

  List<String> select = [
    'Davide',
  ];

  String? selectedValue = 'business Category';

  Rx<File?> imagess = Rx<File?>(null);

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagess.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}
