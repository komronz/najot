import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharitySavedPage extends StatelessWidget {
  CharitySavedPage({required this.cardModel, required this.visible, Key? key }) : super(key: key);
  final CardModel cardModel;
  final bool visible;
  // static const String routeName = '/routeName';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 5, bottom: 10, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(11, 191, 144, 0.08),
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
        ),
        width: 160.w,
        height: 267.w,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: cardModel.image!,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      InkWell(
                        child: FavoriteButton(
                          isFavorite: cardModel.isFavorite!,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ).paddingAll(10)
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: cardModel.title!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    padding: EdgeInsets.all(0),
                    lineHeight: 10.h,
                    animationDuration: 2000,
                    percent: cardModel.progres! / 100,
                    progressColor: AppColorUtils.PERCENT_COLOR,
                    backgroundColor: AppColorUtils.PERCENT_COLOR2,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.textLocale(
                    text: "Bajarildi",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.text(
                    text: "${cardModel.progres.toString().split(".").first}%",
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.BLUE_PERCENT,
                  ).paddingOnly(top: 5.w),
                ],
              ).paddingSymmetric(vertical: 14, horizontal: 12),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;

  const FavoriteButton({
    this.isFavorite = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColorUtils.PURPLE,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.UNLIKE,
              fit: BoxFit.none,
            ),
          )
        : Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColorUtils.IC_GREEN,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.IC_FAVORITE_ADD,
              fit: BoxFit.none,
            ),
          );
  }
}
