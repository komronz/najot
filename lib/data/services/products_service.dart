

import 'package:get_it/get_it.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/http_service.dart';
import 'package:najot/data/services/root_service.dart';

class ProductService{

  List<ProductModel> getProducts() {
    ProductModel productModel= ProductModel(
        applied: 100,
        author: "Eshonov Fakhriyor",
        date: "25.08.2022",
        imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
        project_name: "Drenajni kuzatish uchun mo’jallangan moslama",
        title: "Lorem Ipsum is simply dummy text of the printing and"
            " typesetting industry. Lorem Ipsum has been the industry's "
            "standard dummy text ever since the 1500s, when an unknown"
            " printer took a galley of type and scrambled it to make a "
            "type specimen book",
        totalSum: "500 000"
    );

    List<ProductModel> list=[
      productModel,
      productModel,
      productModel,
      productModel,
      productModel,
    ];
    return list;

  }



}

