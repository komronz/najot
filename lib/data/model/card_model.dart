class CardModel{
  String image;
  String name;
  String title;
  double progres;
  bool isFavorite;
  CardModel(this.image,this.name,this.title,this.progres,this.isFavorite);

  static final List<CardModel> list=[
    CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, true),
    CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, false),
    CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, true),
    CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, true),
    // CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, false),
  ];
}