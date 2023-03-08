import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SliderItem extends StatelessWidget {
  final SliderList sliderModel;

  SliderItem({required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.w,
      width: 320.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl: sliderModel.coverUrl!,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppImageUtils.Splash2,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 144.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 80),
                  blurRadius: 20,
                  blurStyle: BlurStyle.inner,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.text(
                  text: sliderModel.title ?? "",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 7.w,
                ),
                AppWidgets.text(
                  text: sliderModel.description!,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
              ],
            ).paddingOnly(
              left: 18.w,
              right: 18.w,
              bottom: 18.w,
            ),
          ),
        ],
      ),
    );
  }
}
