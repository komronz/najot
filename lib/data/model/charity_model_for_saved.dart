class CharityModelSaved {
  String? image;
  String? title;
  double? progres;
  bool? isFavorite;
  List<InfoModel>? infoModel;

  CharityModelSaved(
      this.image,
      this.title,
      this.progres,
      this.isFavorite,
      this.infoModel,
      );
  CharityModelSaved.named(
      this.image,
      this.title,
      this.progres,
      this.isFavorite,
      );

  static final List<InfoModel> info = [
    InfoModel(
        "Lorem",
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
            "text ever since the 1500s, when an unknown printer took a galley of type "
            "and scrambled it to make a type specimen book"),
    InfoModel(
        "Lorem",
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
            "text ever since the 1500s, when an unknown printer took a galley of type "
            "and scrambled it to make a type specimen book"),
    InfoModel(
        "Lorem",
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
            "text ever since the 1500s, when an unknown printer took a galley of type "
            "and scrambled it to make a type specimen book"),
    InfoModel(
        "Lorem",
        "Lorem Ipsum is simply dummy text of the printing and "
            "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
            "text ever since the 1500s, when an unknown printer took a galley of type "
            "and scrambled it to make a type specimen book")
  ];

  static final List<CharityModelSaved> list = [
    CharityModelSaved(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
        info),
    CharityModelSaved(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        false,
        info),
    CharityModelSaved(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
        info),
    CharityModelSaved(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
        info),
    // CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, false),
  ];
}

class InfoModel {
  InfoModel(this.title, this.text);

  String title;
  String text;
}
