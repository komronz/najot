import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';

class MyCrowdfundingPriceWidget extends StatelessWidget {
  final ProjectModel model;

  const MyCrowdfundingPriceWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var createdAt= DateTime.parse(model.createdAt!);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(text: LocaleKeys.amount_needed.tr(),),
                AppWidgets.textLocale(
                  text:  Format.moneyFormat(double.parse(model.requiredFund!)),
                  color: Color(0xFF043F3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 5.w),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.date_of_announcement,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColorUtils.DARK_6,
                ),
                AppWidgets.text(
                  text:  DateFormat("dd.MM.yyyy").format(createdAt),
                  color: Color(0xFF043F3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 5.w),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20),
        Container(
          width: context.width,
          color: AppColorUtils.GREEN_BACK,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: LocaleKeys.collected,
                    color: AppColorUtils.DARK_6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.done,
                    color: AppColorUtils.DARK_6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: Format.moneyFormat(double.parse(model.amountCollected!)),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.GREEN_TEXT,
                  ),
                  AppWidgets.text(
                    text: "${model.percent.toString().split('.').first} %",
                    color: AppColorUtils.BLUE_PERCENT,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ],
              ).paddingOnly(top: 3),
              LinearPercentIndicator(
                animation: true,
                padding: EdgeInsets.all(0),
                lineHeight: 7.h,
                animationDuration: 2000,
                percent: model.percent! / 100,
                progressColor: AppColorUtils.PERCENT_COLOR,
                backgroundColor: AppColorUtils.PERCENT_COLOR2,
              ).paddingOnly(top: 10.w),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 12.w,
          ),
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}
