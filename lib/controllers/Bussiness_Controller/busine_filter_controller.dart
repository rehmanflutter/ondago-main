import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessFilterController extends GetxController {
  RxBool loctioncheck = true.obs;
  RxBool differentcheck = false.obs;
  RxBool miles = true.obs;

  RxBool teacher = false.obs;
  RxBool babysit = true.obs;
  RxBool nanny = true.obs;
  RxBool now = true.obs;

  RxBool datetiime = true.obs;

  RxInt hour = 10.obs;
  RxInt minut = 10.obs;

  List<String> findWorkers = [
    '2 miles',
    '4 miles',
    '6 miles',
    '10 miles',
    '12 miles',
    '15 miles',
    '20 miles',
  ];

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

  Rx<File?> video = Rx<File?>(null);

  Future<void> getvideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagess.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  //  Date Picker
  //

  //

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    update(); // Notify listeners
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setSelectedDate(picked);
    }
  }

  //  Time Picker
  //

  //

  Rx<TimeOfDay> _selectedTime = TimeOfDay.now().obs;

  TimeOfDay get selectedTime => _selectedTime.value;

  void setSelectedTime(TimeOfDay newTime) {
    _selectedTime.value = newTime;
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime.value,
    );

    if (picked != null && picked != _selectedTime.value) {
      setSelectedTime(picked);
    }
  }
}
