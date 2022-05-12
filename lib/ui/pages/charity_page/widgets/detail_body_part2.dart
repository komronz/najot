import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/kraudfanding_applied_user_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/kraudfanding_price_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DetailBodyPart2 extends StatelessWidget {
  DetailBodyPart2({required this.cardModel});

  CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KraudfandingPriceWidget(model: cardModel),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KraudfandingAppliedUserWidgets(
              model: cardModel,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(
                    text: LocaleKeys.must_collect_date.tr()),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColorUtils.BLUE_PERCENT,
                      size: 14.sp,
                    ),
                    AppWidgets.text(
                      text: "25.02.2022",
                      color: AppColorUtils.BLUE_PERCENT,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ).paddingOnly(left: 6.w),
                  ],
                ).paddingOnly(top: 3.w)
              ],
            ).paddingOnly(left: 30.w)
          ],
        ).paddingSymmetric(
          horizontal: 20.w,
          vertical: 18.w,
        )
      ],
    );
  }
}
