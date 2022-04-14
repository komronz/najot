import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/charity_model.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';

class MyCharityPriceWidget extends StatelessWidget {
  final CharityModel model;

  const MyCharityPriceWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(text: LocaleKeys.amount_needed.tr(),),
                AppWidgets.text(
                  text: model.totalSum!,
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
                  text: model.createdDate!,
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
                    text: LocaleKeys.sum,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.GREEN_TEXT,
                    args: [model.totalSum!],
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

// class CharityAuthorWidget extends StatelessWidget {
//   final CharityModel model;
//
//   const CharityAuthorWidget({
//     required this.model,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               height: 50.w,
//               width: 50.w,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: NetworkImage(model.imgUrl!), fit: BoxFit.cover),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppWidgets.textLocale(
//                   text: "E'lon muallifi",
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                   color: AppColorUtils.DARK_6,
//                 ),
//                 SizedBox(
//                   width: 150.w,
//                   child: AppWidgets.text(
//                     text: model.author!,
//                     color: AppColorUtils.TEXT_GREEN2,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14.sp,
//                   ).paddingOnly(top: 2.w),
//                 ),
//               ],
//             ).paddingOnly(left: 10),
//           ],
//         ),
//         ButtonCard(
//           onPress: () {},
//           text: "Savol berish",
//           width: 100.w,
//           height: 35.w,
//           color: AppColorUtils.GREEN_BTN,
//           textColor: AppColorUtils.GREEN_TEXT,
//           borderRadius: 10,
//           textSize: 12.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ],
//     ).paddingSymmetric(horizontal: 20);
//   }
// }