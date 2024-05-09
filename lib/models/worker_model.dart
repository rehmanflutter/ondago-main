import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerModel {
  String? userId;
  String? userName;
  String? imageUrl;
  String? email;
  String? rating;
  String? price;
  String? time;
  bool? isShow;

  bool? isStart;

  WorkerModel(
      {this.email,
      this.userName,
      this.imageUrl,
      this.price,
      this.rating,
      this.isStart,
      this.time,
      this.userId});

  WorkerModel.fromSnapSHot(DocumentSnapshot<Map<String, dynamic>> data) {
    userId = data.id;
    userName = data.data()!["user_name"] ?? "";
    email = data.data()!["email"] ?? "";
    imageUrl = data.data()!["profile_pic"] ?? "";
    rating = data.data()!["rating"] ?? "";
    price = data.data()!["price"] ?? "";
    time = data.data()!["time"] ?? "";
    isShow = data.data()!["is_show"] ?? "";
    isStart = data.data()!["is_start"] ?? "";

    print('user id is $userId');
  }
}
