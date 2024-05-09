import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ondago/models/job_model.dart';
import 'package:ondago/models/reviews_model.dart';
import 'package:ondago/models/worker_model.dart';

class WorkerController extends GetxController {
  // <========== GET SAVED POSTS ==========>

  Rx<List<WorkerModel>> workersList = Rx<List<WorkerModel>>([]);
  List<WorkerModel> get getworkersList => workersList.value;

  getAllWorkersList() {
    workersList.bindStream(getAllWorkersStream());
  }

  Stream<List<WorkerModel>> getAllWorkersStream() {
    return FirebaseFirestore.instance
        .collection('wokers')
        .where('is_show', isEqualTo: true)
        .snapshots()
        .map((event) {
      List<WorkerModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(WorkerModel.fromSnapSHot(element));
      }

      print('wokers list length is ${retVal.length}');

      return retVal;
    });
  }

  Rx<List<ReviewsModel>> reviewsList = Rx<List<ReviewsModel>>([]);
  List<ReviewsModel> get getreviewsList => reviewsList.value;

  getAlreviewsListList(String userId) {
    reviewsList.bindStream(getAllreviewsListStream(userId));
  }

  Stream<List<ReviewsModel>> getAllreviewsListStream(String userId) {
    return FirebaseFirestore.instance
        .collection('wokers')
        .doc(userId)
        .collection('reviews')
        .snapshots()
        .map((event) {
      List<ReviewsModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(ReviewsModel.fromSnapSHot(element));
      }

      print('wokers list length is ${retVal.length}');

      return retVal;
    });
  }

  Rx<WorkerModel> customerData = WorkerModel().obs;

  WorkerModel get getCustomer => customerData.value;
  set getCustomer(WorkerModel value) => customerData.value = value;

  Future getCustomerInfo() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("wokers")
          .doc('KbbapUMET9PfYNprPurz')
          .get();

      customerData.value = WorkerModel.fromSnapSHot(doc);
    } catch (e) {
      print('error is ${e.toString()}');
    }
  }

  applyForJOb() {
    FirebaseFirestore.instance
        .collection('wokers')
        .doc(getCustomer.userId)
        .update({'is_show': true}).then((value) {
      getCustomerInfo();
    });
  }

  Rx<List<JobModel>> jobList = Rx<List<JobModel>>([]);
  List<JobModel> get getJobList => jobList.value;

  getAllJob() {
    jobList.bindStream(getAllJobStream());
  }

  Stream<List<JobModel>> getAllJobStream() {
    return FirebaseFirestore.instance
        .collection('jobs')
        .snapshots()
        .map((event) {
      List<JobModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(JobModel.fromSnapSHot(element));
      }

      print('wokers list length is ${retVal.length}');

      return retVal;
    });
  }
}
