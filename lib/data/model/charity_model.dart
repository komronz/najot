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
    this.typeOfCharity
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
      typeOfCharity: "item"
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
        typeOfCharity: "item"
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
        typeOfCharity: "cash"

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
        typeOfCharity: "cash"
    ),

  ];
}
