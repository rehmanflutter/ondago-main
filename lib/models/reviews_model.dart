import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewsModel {
  String? userId;
  String? imageUrl;
  String? rating;
  String? review;

  ReviewsModel({this.imageUrl, this.review, this.rating, this.userId});

  ReviewsModel.fromSnapSHot(DocumentSnapshot<Map<String, dynamic>> data) {
    userId = data.id;
    imageUrl = data.data()!["image_url"] ?? "";
    rating = data.data()!["rating"] ?? "";
    review = data.data()!["review"] ?? "";
  }
}
