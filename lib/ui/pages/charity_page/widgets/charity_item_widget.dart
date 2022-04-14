

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/charity_page/widgets/favorite_button.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharityItemWidget extends StatelessWidget {
  final CardModel model;


  const CharityItemWidget({
    required this.model,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 160.w,
        height: 267.w,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
          color: AppColorUtils.WHITE,
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
                              imageUrl: model.image!,
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
                            isFavorite: model.isFavorite!,
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
                      text: model.title!,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      padding: EdgeInsets.all(0),
                      lineHeight: 10.h,
                      animationDuration: 2000,
                      percent: model.progres! / 100,
                      progressColor: AppColorUtils.PERCENT_COLOR,
                      backgroundColor: AppColorUtils.PERCENT_COLOR2,
                    ).paddingOnly(top: 12.w),
                    AppWidgets.textLocale(
                      text: LocaleKeys.done,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK_6,
                    ).paddingOnly(top: 12.w),
                    AppWidgets.text(
                      text: "${model.progres.toString().split(".").first}%",
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
      ),
      onTap: (){
        NavigatorService.to.pushNamed(
          CharityFullPage.routName,
          arguments: model,
        );
      },
    );
  }
}