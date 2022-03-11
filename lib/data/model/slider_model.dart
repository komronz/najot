

import 'package:najot/data/utils/app_image_utils.dart';

class SliderModel{

  SliderModel(this.image,this.title);

  String image;
  String title;


  static final List<SliderModel> list=[
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple"),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple"),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple"),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple"),
  ];

}