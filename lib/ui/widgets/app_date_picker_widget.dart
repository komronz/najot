import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'app_widgets.dart';

// ignore: must_be_immutable
class AppDatePickerWidget extends StatelessWidget {
  AppDatePickerWidget({
    required this.selectFunction,
    Key? key,
  }) : super(key: key);
  final Function(DateTime) selectFunction;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(15.0),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 24.sp,
                  ),
                  AppWidgets.text(
                    text: LocaleKeys.select_date.tr(),
                    fontSize: 20.sp,
                    color: AppColorUtils.dark2,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(left: 8)
                ],
              ).paddingOnly(
                top: 20,
                bottom: 18,
              ),
              SizedBox(
                height: 280.h,
                child: SfDateRangePicker(
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    dateTime =
                        dateRangePickerSelectionChangedArgs.value as DateTime;
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                  allowViewNavigation: true,
                  toggleDaySelection: true,
                  showNavigationArrow: true,
                  navigationMode: DateRangePickerNavigationMode.snap,
                  view: DateRangePickerView.month,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    weekNumberStyle: DateRangePickerWeekNumberStyle(
                      textStyle: const TextStyle(color: AppColorUtils.red),
                      backgroundColor: AppColors.red,
                    ),
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: GoogleFonts.lato(
                        color: AppColorUtils.dark6,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: GoogleFonts.lato(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(color: Colors.black),
                    todayTextStyle: TextStyle(color: Colors.black),
                  ),
                  selectionColor: AppColorUtils.percentColor,
                  yearCellStyle: const DateRangePickerYearCellStyle(
                      todayTextStyle: TextStyle(color: Colors.black)),
                  todayHighlightColor: AppColorUtils.percentColor,
                  startRangeSelectionColor: AppColorUtils.percentColor,
                  selectionShape: DateRangePickerSelectionShape.circle,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppWidgets.appButton(
                      color: AppColorUtils.lightGray,
                      textColor: AppColorUtils.black,
                      onTap: () {
                        NavigatorService.to.pop();
                      },
                      title: LocaleKeys.exit,
                    ).paddingOnly(top: 20.h),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AppWidgets.appButton(
                      onTap: () {
                        selectFunction(dateTime);
                        NavigatorService.to.pop();
                      },
                      title: LocaleKeys.save,
                    ).paddingOnly(top: 20.h),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
