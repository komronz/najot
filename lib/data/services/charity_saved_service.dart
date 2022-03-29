import 'package:najot/data/model/card_model.dart';

import '../model/charity_model_for_saved.dart';

class CharitySavedService {
  Future<List<CardModel>?>? getKraufandingList() async {
    var model = CardModel.kraufanding(
        "KraudfandingSavedPage",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Texnalogiya",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true,
    );
    var list = [
      model,
      model,
      model,
      model,
    ];
    return list;
  }
  Future<List<CardModel>?>? getCharityList() async {
    var model = CardModel.charity(
        "CharitySavedPage",
        "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        "Drenajni kuzatish uchun mo'ljallangan",
        0.6,
        true);
    var list = [
      model,
      model,
      model,
      model,
    ];
    return list;
  }
}
