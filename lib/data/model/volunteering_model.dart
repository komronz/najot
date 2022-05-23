class VolunteeringModel {
  String? imgUrl;
  String? title;
  String? typeVolunteering;
  String? address;
  String? author;
  String? totalSum;
  String? currentSum;
  String? volunteerName;
  String? completedDate;
  String? mobileNumber;
  String? createdDate;
  String? collectedDate;
  bool? isFavorite;
  bool? isDone;
  List<InfoModel>? infoModel;


  VolunteeringModel(
    this.imgUrl,
    this.title,
    this.typeVolunteering,
    this.address,
    this.completedDate,
    this.mobileNumber,
    this.isDone,
    this.collectedDate,
    this.volunteerName,
    this.currentSum,
    this.createdDate,
    this.totalSum,
    this.author,
    this.isFavorite,
    this.infoModel
  );

  VolunteeringModel.fromJson(Map<String, dynamic> json) {
    typeVolunteering = json['type_volunteering']?.toString();
    address=json['address']?.toString();
    completedDate=json['completed_date']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type_volunteering'] = typeVolunteering;
    data['address'] = address;
    data['completed_date'] = completedDate;
    return data;
  }
  static final List<VolunteeringModel> list = [
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        false,
        "23.08.2022",
        null,
        "+1 000 000",
        "2022-05-21T15:18:02.318110+05:00",
        "+10 000 000",
        "Baxrom",
        true,
        info
    ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        true,
        "25.08.2022",
        null,
        "+1 000 000",
        "2022-05-21T15:18:02.318110+05:00",
        "+10 000 000",
        "Baxrom",
        true,
        info
        ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        true,
        "25.08.2022",
        "Abdulloh",
        "+1 000 000",
        "2022-05-21T15:18:02.318110+05:00",
        "+10 000 000",
        "Baxrom",
        true,
        info
        ),
    VolunteeringModel(
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
        "Ovqat qilib berish va uyni yeg’ishtirish ",
        "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
        "25.08.2022",
        "+998979797788",
        false,
        "25.08.2022",
        "Abdulloh",
        "+1 000 000",
        "2022-05-21T15:18:02.318110+05:00",
        "+10 000 000",
        "Baxrom",
        false,
        info
        ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     true,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     true,
    //     info
    // ),
    // VolunteeringModel(
    //     "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
    //     "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
    //     "Ovqat qilib berish va uyni yeg’ishtirish ",
    //     "Toshkent Shahar, Mirobod \n tumani, A Qodiriy 48",
    //     "25.08.2022",
    //     "+998979797788",
    //     false,
    //     "25.08.2022",
    //     "Abdulloh",
    //     "+1 000 000",
    //     "25.08.2022",
    //     "+10 000 000",
    //     "Baxrom",
    //     false,
    //     info
    // ),
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