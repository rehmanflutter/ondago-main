class FindModel {
  String image;
  String title;
  FindModel({
    required this.image,
    required this.title,
  });
}

List<FindModel> findList = [
  FindModel(image: 'assets/images/House rent.png', title: 'House Keeper'),
  FindModel(image: 'assets/images/Taking.png', title: 'Lawn Care'),
  FindModel(image: 'assets/images/Manpainting.png', title: 'painter'),
];
