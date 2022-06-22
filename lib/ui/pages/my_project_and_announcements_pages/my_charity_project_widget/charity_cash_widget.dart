import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class CharityCashWidget extends StatelessWidget {
  final CharityModel model;
  final VoidCallback onTap;

  const CharityCashWidget({
    required this.model,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
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
        width: 175.w,
        height: 298.w,
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
                            top: Radius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: model.imgUrl!,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: model.title!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      AppWidgets.textLocale(
                        text: LocaleKeys.done,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.dark6,
                      ).paddingOnly(
                        right: 5.w,
                      ),
                      AppWidgets.text(
                        fontSize: 12.h,
                        text: "${model.percent.toString().split(".").first}%",
                        fontWeight: FontWeight.w600,
                        color: AppColorUtils.bluePercent,
                      ),
                    ],
                  ).paddingOnly(
                    top: 12.w,
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    padding: const EdgeInsets.all(0),
                    lineHeight: 6.h,
                    animationDuration: 2000,
                    percent: model.percent! / 100,
                    progressColor: AppColorUtils.percentColor,
                    backgroundColor: AppColorUtils.percentColor2,
                  ).paddingOnly(
                    top: 8.w,
                    bottom: 10.h,
                  ),
                  Expanded(
                    child: AppWidgets.starTextWidget(
                      text: LocaleKeys.must_collected_date.tr(),
                      fontSize: 9.sp,
                      hasStar: true,
                    ).paddingOnly(
                      bottom: 7.h,
                    ),
                  ),
                  Row(
                    children: [
                      AppWidgets.imageSvg(
                        path: AppImageUtils.calendarRed,
                        color: AppColorUtils.blueText,
                        height: 11.w,
                      ).paddingOnly(right: 2),
                      AppWidgets.textLocale(
                        text: ": ${model.collectedDate!}",
                        color: AppColorUtils.blueText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(vertical: 14, horizontal: 12),
            )
          ],
        ),
      ),
    );
  }
}
