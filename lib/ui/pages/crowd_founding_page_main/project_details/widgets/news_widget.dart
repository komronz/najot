import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    required this.cardModel,
    Key? key,
  }) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return true
        ? Container(
            padding: EdgeInsets.only(
              top: 12.w,
              left: 12.w,
              right: 12.w,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColorUtils.greenAccent4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(cardModel.image!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: AppWidgets.text(
                                text: "Eshonov Fakhriyor",
                                color: AppColorUtils.textGreen2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                  text: LocaleKeys.project_author,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColorUtils.dark6,
                                ).paddingOnly(right: 65.w),
                                AppWidgets.text(
                                  text: "25.08.2022 18:19",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColorUtils.bluePercent,
                                )
                              ],
                            ).paddingOnly(top: 5),
                          ],
                        ).paddingOnly(left: 10),
                      ],
                    ),
                  ],
                ),
                AppWidgets.text(
                  text: cardModel.infoModel![0].title!,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColorUtils.black,
                ).paddingOnly(
                  bottom: 7.w,
                  top: 18.w,
                ),
                AppWidgets.text(
                    height: 1.5,
                    text: cardModel.infoModel![0].text!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColorUtils.textGrey2,
                    maxLines: 40),
                SizedBox(
                  height: 18.w,
                ),
                SizedBox(
                  height: 229.w,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cardModel.image!,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Column(
              children: [
                SvgPicture.asset(AppImageUtils.news),
                SizedBox(
                  width: 200.sp,
                  child: AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text: LocaleKeys.news_empty,
                      color: AppColorUtils.dark4,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 2),
                )
              ],
            ),
          );
  }
}
