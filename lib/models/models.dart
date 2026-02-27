class IndividualDetails {
  int id;
  String name;
  String image;
  bool isOnline;
  String message;


  IndividualDetails({required this.id,
      required this.name,
      required this.image,
      required this.isOnline,
      required this.message});
}

List<IndividualDetails> individualList = [

  IndividualDetails(id: 1, name: "Kumar", image: "Assets/image.jpg", isOnline: false, message: "Thank you"),
  IndividualDetails(id: 2, name: "Shyam", image: "Assets/image.jpg", isOnline: true, message: "Bye"),
  IndividualDetails(id: 3, name: "Ram", image: "Assets/image.jpg", isOnline: false, message: "Hello"),
  IndividualDetails(id: 4, name: "Suresh", image: "Assets/image.jpg", isOnline: true, message: "How are you?"),
];