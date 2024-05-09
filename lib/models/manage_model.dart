class ManageModel {
  String image;
  String title;
  ManageModel({
    required this.image,
    required this.title,
  });
}

List<ManageModel> manageList = [
  ManageModel(image: 'assets/images/barberchair.png', title: 'Barbar'),
  ManageModel(image: 'assets/images/head.png', title: 'Hair Stylist'),
  ManageModel(image: 'assets/images/m3.png', title: 'Nail Tech'),
];
