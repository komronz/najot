

import 'package:najot/data/utils/app_image_utils.dart';

class SliderModel{

  SliderModel(this.image,this.title,this.like);

  String image;
  String title;
  bool like;


  static final List<SliderModel> list=[
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple",false),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple",false),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple",false),
    SliderModel(AppImageUtils.Slider, "Lorem Ipsum is simple",false),
  ];



}