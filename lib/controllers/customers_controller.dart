import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/worker_controller.dart';
import 'package:ondago/models/customer_model.dart';
import 'package:ondago/views/pages/worker/worker%20list/map_screen.dart';
import 'package:ondago/views/pages/worker/worker%20list/success_page.dart';

class CustomerController extends GetxController {
  WorkerController workerController = Get.put(WorkerController());
  Rx<CustomerModel> customerData = CustomerModel().obs;

  CustomerModel get getCustomer => customerData.value;
  set getCustomer(CustomerModel value) => customerData.value = value;

  Future getCustomerInfo() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("cusotmer")
          .doc('custmer1')
          .get();

      customerData.value = CustomerModel.fromSnapSHot(doc);
    } catch (e) {
      print('error is ${e.toString()}');
    }
  }

  RxBool isProfileEdit = false.obs;

  updateUserProfile(
      {File? image, required String name, required String phone}) async {
    try {
      isProfileEdit.value = true;
      if (image != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(DateTime.now().toString());
        await ref.putFile(image);
        final url = await ref.getDownloadURL();

        Map<String, dynamic> userData = {
          'user_name': name,
          'profile_pic': url,
          'phone_number': phone,
        };

        await FirebaseFirestore.instance
            .collection("cusotmer")
            .doc('custmer1')
            .update(userData)
            .then((value) {
          getCustomerInfo();
        });

        Get.back();
        isProfileEdit.value = false;
      } else {
        Map<String, dynamic> userData = {
          'user_name': name,
          'phone_number': phone,
        };
        await FirebaseFirestore.instance
            .collection("cusotmer")
            .doc('custmer1')
            .update(userData)
            .then((value) {
          getCustomerInfo();
        });
        Get.back();

        isProfileEdit.value = false;
      }
    } catch (e) {
      isProfileEdit.value = false;

      // displayMessage.showMessage(e.toString(), true);
    }
  }

  String workerId = '';

  giveFeedBack(String rating, String review) {
    print('woker id is $workerId');
    FirebaseFirestore.instance
        .collection('wokers')
        .doc(workerId)
        .collection('reviews')
        .add({
      'image_url': getCustomer.imageUrl,
      'rating': rating,
      'review': review,
    }).then((value) {
      Get.offAll(() => SuccessPage());
    });
  }

  createJob(String description) async {
    Map<String, dynamic> jobdata = {
      'image_url': getCustomer.imageUrl,
      'name': getCustomer.userName,
      'description': description,
    };

    FirebaseFirestore.instance.collection('jobs').add(jobdata).then((value) {});
  }

  applyForJOb(String workerId) {
    FirebaseFirestore.instance
        .collection('wokers')
        .doc(workerId)
        .update({'is_start': true}).then((value) {
      //workerController.getCustomerInfo();
      Get.to(() => MapPage());
    });
  }
}
