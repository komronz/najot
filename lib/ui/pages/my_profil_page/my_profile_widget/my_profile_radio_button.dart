import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';

class MyProfileRadioButton extends StatelessWidget {
  final Gender initial;

  const MyProfileRadioButton({
    required this.initial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selection = initial == Gender.MAN ? 1 : 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.text(
          text: LocaleKeys.gender,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColorUtils.DARK_4,
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColorUtils.DARK_6,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColorUtils.DARK_6,
                    value: 1,
                    groupValue: _selection,
                    onChanged: (v) {},
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.man,
                    color: AppColorUtils.DARK_6,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ).paddingOnly(right: 18.w),
            ),
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColorUtils.DARK_6,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Radio(
                    activeColor: AppColorUtils.DARK_6,
                    value: 2,
                    groupValue: _selection,
                    onChanged: (v) {},
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.woman,
                    color: AppColorUtils.DARK_6,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ).paddingOnly(right: 18.w),
            ).paddingOnly(left: 20),
          ],
        ),
      ],
    );
  }
}
