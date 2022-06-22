import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SliderItem extends StatelessWidget {
  final SliderList sliderModel;

  const SliderItem({Key? key, required this.sliderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: sliderModel.cover!,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                AppImageUtils.splash2,
              ),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AppImageUtils.shadow)),
        ),
        Container(
          width: size.width * 0.7,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.text(
                text: sliderModel.title!,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 5,
              ),
              AppWidgets.text(
                text: sliderModel.description!,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
