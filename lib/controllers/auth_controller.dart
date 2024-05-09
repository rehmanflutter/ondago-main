import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/constants/display_message.dart';
import 'package:ondago/constants/internet_service.dart';

class AuthController extends GetxController {
  InternetServices internetServices = InternetServices();
  DisplayMessage displayMessage = DisplayMessage();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final firebaseUser = Rxn<User>();
  User get users => firebaseUser.value!;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());

    super.onInit();
  }

  // <==========  USER REGISTER FUNCTION ==========???

  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController reEnterPasswordCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController phoneNumberCont = TextEditingController();

  RxBool isSignUp = false.obs;

  Future<void> userRegister(File imageFile) async {
    if (await internetServices.checkConnection()) {
      try {
        isSignUp.value = true;
        auth
            .createUserWithEmailAndPassword(
                email: emailCont.text.trim(),
                password: passwordCont.text.trim())
            .then((value) async {
          addUserInformation(imageFile: imageFile, userId: value.user!.uid)
              .then((value) {
            isSignUp.value = false;
            // Get.offAll(BottomBarScreen());
          });
        }).catchError((e) {
          isSignUp.value = false;
          displayMessage.errorMessage(e.toString());
        });
      } catch (e) {
        isSignUp.value = false;
        displayMessage.errorMessage(e.toString());
      }
    } else {
      displayMessage.errorMessage('Internet connection not available');
    }
  }

  Future<void> addUserInformation(
      {required File imageFile, required String userId}) async {
    final ref =
        FirebaseStorage.instance.ref().child('user_images').child(userId);
    await ref.putFile(imageFile);
    final url = await ref.getDownloadURL();
    Map<String, dynamic> userData = {
      'email': emailCont.text,
      'full_name': fullNameCont.text,
      'profile_pic': url,
      'phone_number': url,
      'date_time': DateTime.now(),
      //  'password': ''
    };
    await firestore.collection('users').doc(userId).set(userData);
  }

  Future<void> emailSignUp({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      print('phone number is $phoneNumber');
      // verify phone number with otp code
      TextEditingController codeController = TextEditingController();
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (credentials) async {
            print('verificationCompleted...');
            print('credentials: $credentials');
          },
          codeSent: (String verificationId, int? resendToken) async {
            print('codeSent...');

            print('showOTPDialog...');

            // showOTPDialog(
            //     codeController: codeController,
            //     context: context,
            //     onPressed: () async {
            //       print('in showOTPDialog...');

            //       print('verfication id is $verificationId ');
            //       PhoneAuthCredential credentials =
            //           PhoneAuthProvider.credential(
            //               verificationId: verificationId,
            //               smsCode: codeController.text.trim());

            //       // register new user with phone number
            //       await auth
            //           .signInWithCredential(credentials)
            //           .then((value) async {
            //         print('sign in ');

            //         await FirebaseFirestore.instance
            //             .collection('users')
            //             .doc(auth.currentUser!.uid)
            //             .set({
            //           'first_name': firstName,
            //           'last_name': lastName,
            //           'phone_number': phoneNumber,
            //           'email': email,
            //         });

            //         // CustomersDB().createCustomer(
            //         //     userId: auth.currentUser!.uid,
            //         //     email: email,
            //         //     first_name: firstName,
            //         //     last_name: lastName,
            //         //     phone_number: phoneNumber);
            //         // get email credential about user to link it
            //         final credential = EmailAuthProvider.credential(
            //             email: email, password: pwd);
            //         // close otp window
            //         Navigator.of(context).pop();
            //         // link email for sign in
            //         await auth.currentUser!
            //             .linkWithCredential(credential)
            //             .then((value) {

            //           // Get.offAll(
            //           //   () => const RootPage(),
            //           //   transition: Transition.fadeIn,
            //           // );
            //         });
            //       }).catchError((e) {

            //         print('errrror ==============> not verify $e');
            //         Get.snackbar('Error', e.toString(),
            //             backgroundColor: Colors.red, colorText: Colors.white);
            //       });
            //       // add relative user data to collection
            //     });
          },
          codeAutoRetrievalTimeout: (verificationId) {},
          verificationFailed: (FirebaseAuthException e) {
            print('error at FirebaseAuthException');
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
              Get.snackbar('Invalid Phone Number',
                  '$phoneNumber The provided phone number is not valid.',
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
            // Handle other errors
          });
    } catch (e) {}
  }
}
