
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AppRadioButton extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const AppRadioButton({required this.onChanged, Key? key}) : super(key: key);

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  var _selection = 1;

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
          text: "Gender",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColorUtils.DARK_4,
        ).paddingOnly(bottom: 10),
        Row(
          children: [
            InkWell(
              child: Container(
                height: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selection == 1
                        ? AppColorUtils.KRAUDFANDING
                        : AppColorUtils.DARK_6,
                    width: 1,
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
                      text: "Man",
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
                height: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selection == 2
                        ? AppColorUtils.KRAUDFANDING
                        : AppColorUtils.DARK_6,
                    width: 1,
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
                      text: "Woman",
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