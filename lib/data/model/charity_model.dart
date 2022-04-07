class CharityModel {
  String? title;
  double? percent;
  String? imgUrl;
  String? author;
  String? totalSum;
  String? currentSum;
  int? applied;
  bool? isFavorite;
  String? createdDate;
  String? collectedDate;
  String? typeOfHelp;
  String? volunteerName;
  String? typeOfCharity;
  List<InfoModel>? infoModel;


  CharityModel({
    this.title,
    this.percent,
    this.imgUrl,
    this.author,
    this.totalSum,
    this.currentSum,
    this.applied,
    this.createdDate,
    this.isFavorite,
    this.collectedDate,
    this.typeOfHelp,
    this.volunteerName,
    this.typeOfCharity,
    this.infoModel
  });
  static final List<CharityModel> list = [
    CharityModel(
      title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
      percent: 75.0,
      imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      author: "Fayzullayev Olim",
      totalSum: "1 000 000",
      currentSum: "1 000 000",
      applied: 50,
      createdDate: "25.08.2022",
      isFavorite: false,
      collectedDate: "28.08.2022",
      typeOfHelp: "Oyoq kiyimi",
      volunteerName: "Abdulloh",
      typeOfCharity: "item",
      infoModel: info
    ),
    CharityModel(
        title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        percent: 75.0,
        imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        author: "Fayzullayev Olim",
        totalSum: "1 000 000",
        currentSum: "1 000 000",
        applied: 50,
        createdDate: "25.08.2022",
        isFavorite: false,
        collectedDate: "28.08.2022",
        typeOfHelp: "Oyoq kiyimi",
        volunteerName: "Abdulloh",
        typeOfCharity: "item",
        infoModel: info
    ),
    CharityModel(
        title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        percent: 70.0,
        imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        author: "Fayzullayev Olim",
        totalSum: "1 000 000",
        currentSum: "1 000 000",
        applied: 50,
        createdDate: "25.08.2022",
        isFavorite: false,
        collectedDate: "28.08.2022",
        typeOfHelp: "Oyoq kiyimi",
        volunteerName: null,
        typeOfCharity: "cash",
        infoModel: info
    ),
    CharityModel(
        title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        percent: 70.0,
        imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        author: "Fayzullayev Olim",
        totalSum: "1 000 000",
        currentSum: "1 000 000",
        applied: 50,
        createdDate: "25.08.2022",
        isFavorite: false,
        collectedDate: "28.08.2022",
        typeOfHelp: "Oyoq kiyimi",
        volunteerName: "Abdulloh",
        typeOfCharity: "cash",
        infoModel: info
    ),
  ];

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
}
class InfoModel {
  InfoModel(this.title, this.text);

  String? title;
  String? text;
}