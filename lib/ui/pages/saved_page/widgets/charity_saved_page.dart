import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharitySavedPage extends StatelessWidget {
  const CharitySavedPage(
      {required this.cardModel, required this.visible, Key? key})
      : super(key: key);
  final CardModel cardModel;
  final bool visible;

  // static const String routeName = '/routeName';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
        decoration: BoxDecoration(
          color: AppColorUtils.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
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
              flex: 1,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: cardModel.image!,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
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
            ),
            Expanded(
              flex: 1,
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
                    padding: const EdgeInsets.all(0),
                    lineHeight: 10.h,
                    animationDuration: 2000,
                    percent: cardModel.progres! / 100,
                    progressColor: AppColorUtils.percentColor,
                    backgroundColor: AppColorUtils.percentColor2,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.textLocale(
                    text: LocaleKeys.done,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColorUtils.dark6,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.text(
                    text: "${cardModel.progres.toString().split(".").first}%",
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.bluePercent,
                  ).paddingOnly(top: 5.w),
                ],
              ).paddingSymmetric(vertical: 14, horizontal: 12),
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
              color: AppColorUtils.purple,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.unlike,
              fit: BoxFit.none,
            ),
          )
        : Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColorUtils.icGreen,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.icFavoriteAdd,
              fit: BoxFit.none,
            ),
          );
  }
}
