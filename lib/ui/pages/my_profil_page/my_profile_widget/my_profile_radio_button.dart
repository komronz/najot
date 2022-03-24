import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';

class MyProfileRadioButton extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final Gender gender;

  const MyProfileRadioButton({
    required this.onChanged,
    required this.gender,
    Key? key,
  }) : super(key: key);

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<MyProfileRadioButton> {
  late int _selection;

  @override
  void initState() {
    _selection = widget.gender == Gender.MAN ? 1 : 2;
    super.initState();
  }

  void selectTime(int timeSelected) {
    setState(() {
      _selection = timeSelected;
      widget.onChanged(_selection);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    onChanged: null,
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
                    onChanged: null,
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