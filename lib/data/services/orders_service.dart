import 'package:najot/data/model/kraufanding_model.dart';

class OrdersService {
  Future<List<KraufandingModel>?> getOrderList() async {
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
    List<KraufandingModel> list = [
      model,
      model,
      model,
      model,
      model,
      model,
    ];
    return list;
  }
}
