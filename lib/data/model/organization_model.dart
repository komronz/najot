import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/charity_saved_service.dart';

class OrganizationModel {

  final String name;
  final String image;
  final int count;
  final String title;
  final List<CardModel> list;

  OrganizationModel(this.name,this.image, this.count, this.title, this.list);


  static final List<OrganizationModel> lists = [
    OrganizationModel(
      "Yurak amri",
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      10,
      "Lorem Ipsum is simply dummy text of the printing and "
          "typesetting industry. Lorem Ipsum has been the industry's"
          " standard dummy text ever since the 1500s, when an unknown"
          " printer took a galley of type and scrambled it to make a "
          "type specimen book. It has survived not only five"
          " centuries, but also the lea",
      CharitySavedService().getCharityList(),
    ),
    OrganizationModel(
      "Yurak amri",
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      10,
      "Lorem Ipsum is simply dummy text of the printing and "
          "typesetting industry. Lorem Ipsum has been the industry's"
          " standard dummy text ever since the 1500s, when an unknown"
          " printer took a galley of type and scrambled it to make a "
          "type specimen book. It has survived not only five"
          " centuries, but also the lea",
      CharitySavedService().getCharityList(),
    ),
    OrganizationModel(
      "Yurak amri",
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      10,
      "Lorem Ipsum is simply dummy text of the printing and "
          "typesetting industry. Lorem Ipsum has been the industry's"
          " standard dummy text ever since the 1500s, when an unknown"
          " printer took a galley of type and scrambled it to make a "
          "type specimen book. It has survived not only five"
          " centuries, but also the lea",
      CharitySavedService().getCharityList(),
    ),

    OrganizationModel(
      "Yurak amri",
      "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      10,
      "Lorem Ipsum is simply dummy text of the printing and "
          "typesetting industry. Lorem Ipsum has been the industry's"
          " standard dummy text ever since the 1500s, when an unknown"
          " printer took a galley of type and scrambled it to make a "
          "type specimen book. It has survived not only five"
          " centuries, but also the lea",
      CharitySavedService().getCharityList(),
    ),

  ];
}
