import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/MixTextWidget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/text_field_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class SupportProjectDialog extends StatelessWidget {
  const SupportProjectDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 340.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.textLocale(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColorUtils.DARK2,
              textAlign: TextAlign.center,
              text: LocaleKeys.project_implementation,
            ),
            AppWidgets.textLocale(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColorUtils.DARK_6,
              textAlign: TextAlign.center,
              text: LocaleKeys.enter_amount,
            ).paddingSymmetric(vertical: 10.w),
            TextFieldWidget(
              hintText: "500 000 ${LocaleKeys.som.tr()}",
              onChanged: (v) {},
              title: '',
            ),
          MixTextWidget().paddingSymmetric(vertical: 12.w),
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
            SizedBox(
              height: 12.w,
            ),
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
