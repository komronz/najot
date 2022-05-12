import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/model/kraufanding_model.dart';

class CharityHistoryService {
  Future<List<CharityModel>?>? getCharityList() async {
    var model = CharityModel(
      title:
          "Anjelani operasiyasiga pul kerak!Anjelani operasiyasiga pul kerak!Anjelani operasiyasiga pul kerak!",
      applied: 100,
      author: "Abdumalik Sapoqulov Abdumalik SapoqulovAbdumalik Sapoqulov",
      createdDate: '13.03.2022',
      currentSum: "60 000 000",
      imgUrl:
          "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      percent: 60.0,
      totalSum: "100 000 000",
      isFavorite: true,
    );
    var list = [
      model,
      model,
      model,
      model,
      model,
    ];
    return list;
  }

  Future<List<KraufandingModel>?>? getKraufandingList() async {
    var model = KraufandingModel(
      title:
          "Drenajni kuzatish uchun mo’jallangan moslama Drenajni kuzatish uchun mo’jallangan moslamaDrenajni kuzatish uchun mo’jallangan moslamaDrenajni kuzatish uchun mo’jallangan moslama ",
      applied: 100,
      author: "Abdumalik Sapoqulov Abdumalik SapoqulovAbdumalik Sapoqulov",
      createdDate: '25.08.2022',
      currentSum: "10 000 000",
      imgUrl:
          "https://shop.chuztrade.uz/wp-content/uploads/2019/07/201807180855191848538.jpg",
      percent: 10.0,
      totalSum: "100 000 000",
      isFavorite: false,
    );
    var list = [
      model,
      model,
      model,
      model,
      model,
    ];
    return list;
  }

  Future<List<CharityModel>?>? getItemsList() async {
    var model = CharityModel(
      title: "Ularni qishga kiygani kiyimlari yo’q",
      author: "Abdumalik Sapoqulov Abdumalik SapoqulovAbdumalik Sapoqulov",
      createdDate: '25.08.2022',
      typeOfCharity: "Oyoq kiyim",
    );
    var list = [
      model,
      model,
      model,
      model,
      model,
    ];
    return list;
  }
}
