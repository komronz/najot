import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/MixTextWidget.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';

import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/utils/app_image_utils.dart';

class VolunteerDonateWidget extends StatelessWidget {
  VolunteerDonateWidget({required this.cardModel});

  ProjectModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            text: LocaleKeys.donate,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.DARK2,
          ).paddingOnly(
            left: 20.w,
            top: 20.w,
            bottom: 3.w,
          ),
          AppWidgets.text(
                  text: cardModel.title??"",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK2,
                  maxLines: 50,
                  height: 1.4.w)
              .paddingOnly(
            left: 20.w,
            right: 20.w,
            bottom: 12.w,
          ),
          AppWidgets.textLocale(
                  text: LocaleKeys.person_applied,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_6)
              .paddingSymmetric(horizontal: 20.w),
          AppWidgets.circleImages(
            count: cardModel.investorsCount!,
          ).paddingSymmetric(horizontal: 20.w),
          AppWidgets.textLocale(
              text: LocaleKeys.card_number.tr(),
              fontSize: 16.sp,
              color: AppColorUtils.DARK_6,
              fontWeight: FontWeight.w400).paddingOnly(left: 20.w),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColorUtils.GREEN_ACCENT5,
              ),
              child: InkWell(
                onTap: () {
                  FlutterClipboard.copy(cardModel.cardNumber!);
                  AppWidgets.showText(
                    text: LocaleKeys.be_save.tr(),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 48.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImageUtils.UZCARD),
                      SizedBox(
                        width: 10.w,
                      ),
                      AppWidgets.text(
                          text: cardModel.cardNumber!,
                          color: AppColorUtils.KRAUDFANDING,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)
                    ],
                  ),
                ),
              ),
            ),
          ).paddingSymmetric(horizontal: 20.w,vertical: 10),
          MixTextWidget().paddingSymmetric(
            vertical: 12.w,
            horizontal: 20.w,
          ),
          ButtonCard(
            onPress: () {},
            text: LocaleKeys.switch_amount,
            textSize: 16.sp,
            fontWeight: FontWeight.w500,
            height: 50.w,
            width: MediaQuery.of(context).size.width,
            color: AppColorUtils.PERCENT_COLOR,
            textColor: AppColorUtils.WHITE,
            borderRadius: 10,
          ).paddingSymmetric(horizontal: 20.w),
        ],
      ),
    );
  }
}
