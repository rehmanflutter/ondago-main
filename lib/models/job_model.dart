import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String? userId;
  String? userName;
  String? imageUrl;
  String? description;

  JobModel({
    this.description,
    this.userName,
    this.imageUrl,
  });

  JobModel.fromSnapSHot(DocumentSnapshot<Map<String, dynamic>> data) {
    userId = data.id;
    userName = data.data()!["name"] ?? "";
    description = data.data()!["description"] ?? "";
    imageUrl = data.data()!["image_url"] ?? "";

    print('user id is $userId');
  }
}
