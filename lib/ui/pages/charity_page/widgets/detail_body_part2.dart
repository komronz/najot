import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/crowdfunding_price_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DetailBodyPart2 extends StatelessWidget {
  DetailBodyPart2({required this.cardModel});

  ProjectModel cardModel;

  @override
  Widget build(BuildContext context) {
    var modifiedAt = DateTime.parse(cardModel.modifiedAt!);
    return Column(
      children: [
        CrowdfundingPriceWidget(model: cardModel),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Change later
            ///
            // CrowdfundingAppliedUserWidgets(
            //   model: cardModel,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.starTextWidget(
                      text: LocaleKeys.must_collect_date.tr()),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: AppColorUtils.BLUE_PERCENT,
                        size: 13.sp,
                      ),
                      AppWidgets.text(
                        text: DateFormat("dd.MM.yyyy").format(modifiedAt),
                        color: AppColorUtils.BLUE_PERCENT,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ).paddingOnly(left: 6.w, top: 3.w),
                    ],
                  ).paddingOnly(top: 3.w)
                ],
              ).paddingOnly(left: 5.w),
            )
            
            ///Change later
            ///
            /// ).paddingOnly(left: 30.w)
          ],
        ).paddingSymmetric(
          horizontal: 20.w,
          vertical: 18.w,
        )
      ],
    );
  }
}
