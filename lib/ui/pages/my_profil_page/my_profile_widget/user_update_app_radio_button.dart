import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';

class UserUpdateAppRadioButton extends StatefulWidget {
  final ValueChanged<int> onChanged;
  String initial;

  UserUpdateAppRadioButton(
      {required this.onChanged, required this.initial, Key? key})
      : super(key: key);

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<UserUpdateAppRadioButton> {
  late int _selection;

  void selectTime(int timeSelected) {
    setState(() {
      _selection = timeSelected;
      widget.onChanged(_selection);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _selection = widget.initial == Gender.MAN.toString() ? 1 : 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.text(
          text: LocaleKeys.gender.tr(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColorUtils.DARK_4,
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            InkWell(
              child: Container(
                height: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selection == 1
                        ? AppColorUtils.KRAUDFANDING
                        : AppColorUtils.DARK_6,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Radio(
                      activeColor: AppColorUtils.KRAUDFANDING,
                      value: 1,
                      groupValue: _selection,
                      onChanged: (v) => selectTime(v as int),
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.man,
                      color: _selection == 1
                          ? AppColorUtils.KRAUDFANDING
                          : AppColorUtils.DARK_6,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ).paddingOnly(right: 18.w),
              ),
              onTap: () {
                setState(() {
                  _selection = 1;
                  selectTime(1);
                });
              },
            ),
            InkWell(
              child: Container(
                height: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selection == 2
                        ? AppColorUtils.KRAUDFANDING
                        : AppColorUtils.DARK_6,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Radio(
                      activeColor: _selection == 2
                          ? AppColorUtils.KRAUDFANDING
                          : AppColorUtils.DARK_6,
                      value: 2,
                      groupValue: _selection,
                      onChanged: (v) => selectTime(v as int),
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.woman,
                      color: _selection == 2
                          ? AppColorUtils.KRAUDFANDING
                          : AppColorUtils.DARK_6,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ).paddingOnly(right: 18.w),
              ).paddingOnly(left: 20),
              onTap: () {
                setState(() {
                  _selection = 2;
                  selectTime(2);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
