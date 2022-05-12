import 'package:najot/data/model/card_model.dart';

class CharitySavedService {
  Future<List<CardModel>?>? getKraufandingList() async {
    var model = CardModel.kraufanding(
        "1",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Texnalogiya",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
        "22.08.2022");
    var model1 = CardModel.kraufanding(
        "2",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Texnalogiya",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
        "22.08.2022");
    var list = [
      model,
      model1,
      model,
      model1,
    ];
    return list;
  }

  List<CardModel> getCharityList() {
    var model = CardModel.charity(
        "CharitySavedPage",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        60,
        true,
        "22.08.2022",
        CardModel.info);

    var model1 = CardModel.charity(
        "CharitySavedPage",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        null,
        true,
        "22.08.2022",
        CardModel.info);

    var list = [
      model,
      model1,
      model,
      model1,
    ];
    return list;
  }
}
