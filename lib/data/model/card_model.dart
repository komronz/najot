
class CardModel {
  String? type;
  String? image;
  String? name;
  String? date;
  String? title;
  double? progres;
  bool? isFavorite;
  List<InfoModel>? infoModel;

  CardModel(
    this.image,
    this.name,
    this.title,
    this.progres,
    this.isFavorite,
    this.infoModel,
    this.date,
  );

  CardModel.kraufanding(
    this.type,
    this.image,
    this.name,
    this.title,
    this.progres,
    this.isFavorite,
    this.date,
  );

  CardModel.charity(
    this.type,
    this.image,
    this.title,
    this.progres,
    this.isFavorite,
    this.date,
      this.infoModel
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

  static final List<CardModel> list = [
    CardModel(
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      "Texnalogiya",
      "Drenajni kuzatish uchun mo'ljallangan",
      0.6,
      true,
      info,
      "22.08.2022",
    ),
    CardModel(
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      "Texnalogiya",
      "Drenajni kuzatish uchun mo'ljallangan",
      0.6,
      false,
      info,
      "22.08.2022",
    ),
    CardModel(
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      "Texnalogiya",
      "Drenajni kuzatish uchun mo'ljallangan",
      0.6,
      true,
      info,
      "22.08.2022",
    ),
    CardModel(
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      "Texnalogiya",
      "Drenajni kuzatish uchun mo'ljallangan",
      0.6,
      true,
      info,
      "22.08.2022",
    ),
    // CardModel("assets/images/rasm.jpg", "Texnalogiya", "Drenajni kuzatish uchun mo'ljallangan", 0.6, false),
  ];
}

class InfoModel {
  InfoModel(this.title, this.text);

  String? title;
  String? text;
}



