import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/mix_text_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/text_field_widget.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

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
          color: AppColorUtils.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.textLocale(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColorUtils.dark2,
              textAlign: TextAlign.center,
              text: LocaleKeys.project_implementation,
            ),
            AppWidgets.textLocale(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: AppColorUtils.dark6,
              textAlign: TextAlign.center,
              text: LocaleKeys.enter_amount,
            ).paddingSymmetric(vertical: 10.w),
            TextFieldWidget(
              hintText: "500 000 ${LocaleKeys.som.tr()}",
              onChanged: (v) {},
              title: '',
            ),
            const MixTextWidget().paddingSymmetric(vertical: 12.w),
            ButtonCard(
              onPress: () {},
              text: LocaleKeys.switch_amount.tr(),
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.percentColor,
              textColor: AppColorUtils.white,
              borderRadius: 10,
            ),
            SizedBox(
              height: 12.w,
            ),
            ButtonCard(
              onPress: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.exit.tr(),
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.greenAccent5,
              textColor: AppColorUtils.black,
              borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
