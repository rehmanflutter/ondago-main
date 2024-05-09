class CareModel {
  String image;
  String title;

  CareModel({
    required this.image,
    required this.title,
  });
}

List<CareModel> careList = [
  CareModel(image: 'assets/images/doctor.png', title: 'Child Care'),
  CareModel(image: 'assets/images/slich.png', title: 'Senior Care'),
  CareModel(image: 'assets/images/Redcross.png', title: 'Special Need'),
  CareModel(image: 'assets/images/pet.png', title: 'Pet Care'),
  CareModel(image: 'assets/images/child.png', title: 'Child Care'),
];
