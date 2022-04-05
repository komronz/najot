class VolunteeringModel {
  String? imgUrl;
  String? title;
  String? typeVolunteering;
  String? address;
  String? completedDate;
  String? mobileNumber;
  bool? isDone;

  VolunteeringModel(
    this.imgUrl,
    this.title,
    this.typeVolunteering,
    this.address,
    this.completedDate,
    this.mobileNumber,
    this.isDone,
  );
  static final List<VolunteeringModel> list = [
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        false,
        ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        true,
        ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        false,
        ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        true,
        ),
  ];
}