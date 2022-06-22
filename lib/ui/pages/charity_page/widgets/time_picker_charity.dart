import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/custom_time_picker/date_picker/date_picker_theme.dart';
import 'package:najot/data/custom_time_picker/date_picker/i18n/date_picker_i18n.dart';
import 'package:najot/data/custom_time_picker/date_picker/widget/date_picker_widget.dart';
import 'package:najot/data/custom_time_picker/flutter_time_picker_spinner.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_widget/item_adding_success.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

// ignore: must_be_immutable
class TimePikerCharity extends StatelessWidget {
  TimePikerCharity({
    Key? key,
    required this.model,
    required this.cubit,
    required this.con,
  }) : super(key: key);

  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  CardModel model;
  CharityCubit cubit;
  BuildContext con;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: AppWidgets.text(
                  text: LocaleKeys.add_to_note.tr(),
                  fontSize: 20.sp,
                  color: AppColorUtils.dark2,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingOnly(
                top: 20,
                bottom: 12,
              ),
              Container(
                width: double.infinity,
                color: AppColorUtils.whiteGrey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppWidgets.starTextWidget(
                        text: LocaleKeys.date_of_completion,
                        isCenter: true,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.volontyor,
                      ).paddingOnly(bottom: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppWidgets.imageSvg(
                            path: AppImageUtils.calendarRed,
                            color: AppColorUtils.volontyor,
                            height: 16,
                          ).paddingOnly(right: 5),
                          AppWidgets.textLocale(
                            text: model.date!,
                            color: AppColorUtils.volontyor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ).paddingOnly(
                    top: 10,
                    bottom: 10,
                  ),
                ),
              ).paddingOnly(
                bottom: 24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: AppColorUtils.gray3,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppWidgets.imageSvg(
                          path: AppImageUtils.notificationGrey,
                          color: const Color(0xFF415B55),
                        ).paddingOnly(right: 5),
                        Expanded(
                          child: AppWidgets.textLocale(
                            text: LocaleKeys.select_date_time,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF415B55),
                          ),
                        ),
                      ],
                    ).paddingOnly(
                      bottom: 17,
                    ),
                    TimePickerSpinner(
                      is24HourMode: true,
                      normalTextStyle: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF9FB6B0),
                        fontWeight: FontWeight.w400,
                      ),
                      isForce2Digits: true,
                      highlightedTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: AppColorUtils.greenText,
                        decorationStyle: TextDecorationStyle.solid,
                        inherit: true,
                        fontWeight: FontWeight.w500,
                      ),
                      spacing: 15.sp,
                      itemHeight: 40,
                      onTimeChange: (time) {
                        _time = DateTime(
                          time.month,
                          time.month,
                          time.day,
                          time.hour,
                          time.minute,
                        );
                      },
                    ),
                    DatePickerWidget(
                      locale: context.locale == const Locale("uz", "UZ")
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
                        backgroundColor: AppColorUtils.white,
                        itemTextStyle: TextStyle(
                          color: AppColorUtils.greenText,
                          fontSize: 16.sp,
                        ),
                        dividerColor: AppColorUtils.dividerColor,
                      ),
                    ),
                  ],
                ).paddingSymmetric(
                  vertical: 24,
                  horizontal: 18,
                ),
              ).paddingOnly(
                left: 25,
                right: 25,
                bottom: 18,
              ),
              Column(
                children: [
                  AppWidgets.appButton(
                    onTap: () async {
                      var dateTime = DateTime(
                        _date.year,
                        _date.month,
                        _date.day,
                        _time.hour,
                        _time.minute,
                      );
                      NavigatorService.to.pop();
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => ItemAddingSuccess(
                          dateTime: dateTime,
                          goto: () {
                            cubit.onChangeSave(false);
                            cubit.load();
                            Navigator.pop(con);
                            Navigator.pop(context);
                          },
                          back: () {
                            cubit.onChangeSave(false);
                            cubit.load();
                            Navigator.pop(con);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    title: LocaleKeys.save,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 12.h),
                  AppWidgets.appButton(
                    color: AppColorUtils.lightGray,
                    textColor: AppColorUtils.black,
                    onTap: () {
                      NavigatorService.to.pop();
                    },
                    title: LocaleKeys.exit,
                    fontSize: 16.sp,
                  ),
                ],
              ).paddingOnly(
                left: 25,
                right: 25,
                bottom: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
