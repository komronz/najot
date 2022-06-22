import 'package:najot/data/utils/app_image_utils.dart';

class SliderModel {
  SliderModel(this.image, this.title, this.like);

  String image;
  String title;
  bool like;

  static final List<SliderModel> list = [
    SliderModel(AppImageUtils.slider, "Lorem Ipsum is simple", false),
    SliderModel(AppImageUtils.slider, "Lorem Ipsum is simple", false),
    SliderModel(AppImageUtils.slider, "Lorem Ipsum is simple", false),
    SliderModel(AppImageUtils.slider, "Lorem Ipsum is simple", false),
  ];
}
