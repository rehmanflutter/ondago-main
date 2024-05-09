import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final emailcontroller = TextEditingController();
  RxBool passwordshow = true.obs;
}
