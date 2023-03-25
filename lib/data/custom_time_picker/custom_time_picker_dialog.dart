import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/custom_time_picker/flutter_time_picker_spinner.dart';
import '../../ui/pages/main_page/widgets/button_card_widget.dart';
import '../localization/locale_keys.g.dart';
import '../utils/app_color_utils.dart';
import 'date_picker/date_picker_theme.dart';
import 'date_picker/i18n/date_picker_i18n.dart';
import 'date_picker/widget/date_picker_widget.dart';

class CustomTimePickerDialog extends StatefulWidget {
  CustomTimePickerDialog({
    required this.title,
  });
  final String title;

  @override
  _CustomTimePickerDialogState createState() => _CustomTimePickerDialogState();
}

class _CustomTimePickerDialogState extends State<CustomTimePickerDialog> {
  DateTime _time = DateTime.now();
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColorUtils.BACK_AD,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10.h),
              Text(
                LocaleKeys.executable_date.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColorUtils.GRAY_3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: DatePickerWidget(
                  locale: context.locale == Locale("uz", "UZ")
                      ? DateTimePickerLocale.uz
                      : DateTimePickerLocale.ru,
                  firstDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(
                    DateTime.now().year + 2,
                  ),
                  dateFormat: "dd-MMMM-yyyy",
                  onChange: (DateTime newDate, _) {
                    _date = newDate;
                    // print(_date);
                  },
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: AppColorUtils.DARK_4,
                    itemTextStyle: TextStyle(
                      color: AppColorUtils.WHITE,
                      fontSize: 16.sp,
                    ),
                    dividerColor: AppColorUtils.DIVIDER_COLOR,
                  ),
                ),
              ),
              Text(
                LocaleKeys.executable_date.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColorUtils.WHITE,
                ),
              ),
              TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white38,
                  fontWeight: FontWeight.w400,
                ),
                isForce2Digits: true,
                highlightedTextStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColorUtils.WHITE,
                  decorationStyle: TextDecorationStyle.solid,
                  inherit: true,
                  fontWeight: FontWeight.w500,
                ),
                spacing: 15.sp,
                itemHeight: 40,
                onTimeChange: (time) {
                  setState(
                    () {
                      _time = DateTime(
                        time.month,
                        time.month,
                        time.day,
                        time.hour < 8 ? time.hour + 16 : time.hour,
                        time.minute,
                      );

                      // print(_time);
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: ButtonCard(
                  onPress: () {
                    ///Change later
                    ///
                    // var dateTime = DateTime(
                    //   _date.year,
                    //   _date.month,
                    //   _date.day,
                    //   _time.hour,
                    //   _time.minute,
                    //   _time.second,
                    // ).add(Duration(minutes: 30));

                    Navigator.pop(context);
                  },
                  text: LocaleKeys.executable_date.tr(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: AppColorUtils.DARK_4,
                  textColor: AppColorUtils.WHITE,
                  borderRadius: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ButtonCard(
                  onPress: () {
                    if (_date.month == DateTime.now().month &&
                        _date.day == DateTime.now().day) {
                      if ((_time.hour * 60 + _time.minute) -
                              (DateTime.now().hour * 60 +
                                  DateTime.now().minute) >
                          30) {
                        ///Change later
                        ///
                        // var dateTime = DateTime(
                        //   _date.year,
                        //   _date.month,
                        //   _date.day,
                        //   _time.hour,
                        //   _time.minute,
                        //   _time.second,
                        // );
                        // RootService.appBloc.orderBloc.add(
                        //   OrderDateTimeEvent(
                        //     dateTime: dateTime,
                        //     isMinTime: true,
                        //   ),
                        // );
                        Navigator.pop(context);
                      } else {
                        // AppWidgets.showToast(LocaleKeys.select_long_time.tr());
                      }
                    } else {
                      ///Change later
                      ///
                      // var dateTime = DateTime(
                      //   _date.year,
                      //   _date.month,
                      //   _date.day,
                      //   _time.hour,
                      //   _time.minute,
                      //   _time.second,
                      // );
                      // RootService.appBloc.orderBloc.add(
                      //   OrderDateTimeEvent(
                      //     dateTime: dateTime,
                      //     isMinTime: true,
                      //   ),
                      // );
                      Navigator.pop(context);
                    }
                  },
                  text: LocaleKeys.save.tr(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  textColor: AppColorUtils.WHITE,
                  borderRadius: 10,
                  color: AppColorUtils.RED,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
