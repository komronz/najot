import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/ui/pages/home_page/widget/slider_item_widget.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<SliderList?> sliderList;

  CarouselSliderWidget({required this.sliderList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Swiper(
        itemBuilder: (context, index) {
          return SliderItem(
            sliderModel: sliderList[index]!,
          );
        },
        viewportFraction: 0.9,
        scale: 0.95,
        autoplay: true,
        itemCount: sliderList.length,
      ),
    );
  }
}
