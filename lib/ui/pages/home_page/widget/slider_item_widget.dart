import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/model/slider_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SliderItem extends StatelessWidget {
  final SliderList sliderModel;

  SliderItem({required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: sliderModel.image!,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                AppImageUtils.NOTIFICATION,
              ),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

          ),
        ),
        Container(
          width: size.width,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AppImageUtils.SHADOW)),
        ),
        Container(
          width: size.width * 0.7,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.text(
                text: LocaleKeys.crowdfunding.tr(),
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 5,
              ),
              AppWidgets.text(
                text: sliderModel.title!,
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
