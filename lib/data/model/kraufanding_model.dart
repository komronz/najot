class KraufandingModel {
  String? title;
  double? percent;
  String? imgUrl;
  String? author;
  String? totalSum;
  String? currentSum;
  int? applied;
  bool? isFavorite;
  String? createdDate;
  List<InfoModel>? infoModel;

  KraufandingModel({
    this.title,
    this.percent,
    this.imgUrl,
    this.author,
    this.totalSum,
    this.currentSum,
    this.applied,
    this.createdDate,
    this.isFavorite,
    this.infoModel,
  });

  static final List<KraufandingModel> list = [
    KraufandingModel(
      title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
      percent: 60.0,
      imgUrl:
          "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      author: "Fayzullayev Olim",
      totalSum: "1 000 000",
      currentSum: "1 000 000",
      applied: 50,
      createdDate: "25.08.2022",
      isFavorite: false,
      infoModel: info,
    ),
    KraufandingModel(
        title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        percent: 60.0,
        imgUrl:
            "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        author: "Fayzullayev Olim",
        totalSum: "1 000 000",
        currentSum: "1 000 000",
        applied: 50,
        createdDate: "25.08.2022",
        isFavorite: false,
        infoModel: info),
    KraufandingModel(
      title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
      percent: 60.0,
      imgUrl:
          "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      author: "Fayzullayev Olim",
      totalSum: "1 000 000",
      currentSum: "1 000 000",
      applied: 50,
      createdDate: "25.08.2022",
      isFavorite: false,
      infoModel: info,
    ),
    KraufandingModel(
      title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
      percent: 60.0,
      imgUrl:
          "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      author: "Fayzullayev Olim",
      totalSum: "1 000 000",
      currentSum: "1 000 000",
      applied: 50,
      createdDate: "25.08.2022",
      isFavorite: false,
      infoModel: info,
    ),
  ];
  static final List<InfoModel> info = [
    InfoModel("Lorem",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
            " when an unknown printer took a galley of type and scrambled it to make a type specimen book."
            " It has survived not only five centuries, but also the leap into electronic typesetting, "
            "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset"
            " sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
            "Aldus PageMaker including versions of Lorem Ipsum."),
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
}

class InfoModel {
  InfoModel(this.title, this.text);

  String? title;
  String? text;
}
