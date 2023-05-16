import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/main_page/widgets/slider_item_widget.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<SliderList> sliderList;

  CarouselSliderWidget({required this.sliderList});

  @override
  Widget build(BuildContext context) {
    AppLoggerUtil.d("slider: ${sliderList[0].description}\n ${sliderList[0].title}");
    return SizedBox(
      height: 220.w,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        itemCount: sliderList.length,
        itemBuilder: (context, index) {
          return SliderItem(
            sliderModel: sliderList[index],
          );
        },
        loop: false,
        viewportFraction: 0.9,
        scale: 0.95,
        autoplay: false,
        duration: 2000,
        autoplayDelay: 10000,
      ),
    );
  }
}
