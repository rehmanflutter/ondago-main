import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String? userId;
  String? userName;
  String? imageUrl;
  String? email;
  String? phoneNumber;

  CustomerModel({
    this.email,
    this.userName,
    this.imageUrl,
  });

  CustomerModel.fromSnapSHot(DocumentSnapshot<Map<String, dynamic>> data) {
    userId = data.id;
    userName = data.data()!["user_name"] ?? "";
    email = data.data()!["email"] ?? "";
    imageUrl = data.data()!["profile_pic"] ?? "";
    phoneNumber = data.data()!["phone_number"] ?? "";

    print('user id is $userId');
  }
}
