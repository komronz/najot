

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class PaymentHistoryDialog extends StatelessWidget {
  const PaymentHistoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
      EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 260.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            AppWidgets.textLocale(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: AppColorUtils.DARK2,
              textAlign: TextAlign.center,
              text: LocaleKeys.payment_history,
            ),
            AppWidgets.textLocale(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColorUtils.DARK_6,
              textAlign: TextAlign.center,
              text: LocaleKeys.was_implementation,
            ).paddingOnly(top: 15.w,bottom: 5.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppWidgets.textLocale(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: AppColorUtils.DARK2,
                  textAlign: TextAlign.center,
                  text: LocaleKeys.summa,
                ),
                AppWidgets.textLocale(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColorUtils.PERCENT_COLOR,
                  textAlign: TextAlign.center,
                  text: "100 000 so'm",
                ),
              ],
            ),
            SizedBox(height: 10.w,),

            ButtonCard(
              onPress: () {},
              text: LocaleKeys.switch_amount,
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.PERCENT_COLOR,
              textColor: AppColorUtils.WHITE,
              borderRadius: 10,
            ),
            SizedBox(height: 12.w,),
            ButtonCard(
              onPress: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.exit,
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.GREEN_ACCENT5,
              textColor: AppColorUtils.BLACK,
              borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}