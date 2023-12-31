import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_volunteering_cubit/my_volunteering_cubit.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/custom_time_picker/flutter_time_picker_spinner.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_widget/item_adding_success.dart';
import 'package:najot/ui/pages/notification_page/notification_page.dart';
import '../../../../data/custom_time_picker/date_picker/date_picker_theme.dart';
import '../../../../data/custom_time_picker/date_picker/i18n/date_picker_i18n.dart';
import '../../../../data/custom_time_picker/date_picker/widget/date_picker_widget.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../widgets/app_widgets.dart';

class ItemCharityDatePickerWidget extends StatelessWidget {
  ItemCharityDatePickerWidget({
    required this.selectFunction,
    required this.model,
    required this.index,
    required this.cubit,
    Key? key,
  }) : super(key: key);
  final Function selectFunction;
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  final MyVolunteeringCubit cubit;
  final VolunteerDonateResults model;
  final int index;

  @override
  Widget build(BuildContext context) {
    var createdAt = DateTime.parse(model.project!.modifiedAt!);
    return BlocBuilder<MyVolunteeringCubit, MyVolunteeringState>(
        bloc: cubit,
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: ShapeDecoration(
                    color: AppColors.WHITE,
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
                          color: AppColorUtils.DARK2,
                          fontWeight: FontWeight.w600,
                        ),
                      ).paddingOnly(
                        top: 20.w,
                        bottom: 10.w,
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColorUtils.WHITE_GREY,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppWidgets.starTextWidget(
                                text: LocaleKeys.executable_date,
                                isCenter: true,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.BLUE_TEXT,
                              ).paddingOnly(bottom: 5.w),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppWidgets.imageSvg(
                                    path: AppImageUtils.CALENDAR_RED,
                                    color: AppColorUtils.BLUE_TEXT,
                                    height: 16.w,
                                  ).paddingOnly(right: 5.w),
                                  AppWidgets.textLocale(
                                    text: DateFormat("dd.MM.yyyy")
                                        .format(createdAt),
                                    color: AppColorUtils.BLUE_TEXT,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ).paddingOnly(
                            top: 10.w,
                            bottom: 10.w,
                          ),
                        ),
                      ).paddingOnly(
                        bottom: 20.w,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: AppColorUtils.GRAY_3,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppWidgets.imageSvg(
                                  path: AppImageUtils.NOTIFICATION_GREY,
                                  color: AppColorUtils.GREEN_BLACK2,
                                  height: 14.w,
                                ).paddingOnly(right: 5.w),
                                Expanded(
                                  child: AppWidgets.textLocale(
                                    text: LocaleKeys.select_date_time,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColorUtils.GREEN_BLACK2,
                                  ),
                                ),
                              ],
                            ).paddingOnly(
                              bottom: 5.w,
                            ),
                            Container(
                              child: TimePickerSpinner(
                                is24HourMode: true,
                                normalTextStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColorUtils.GREEN_10,
                                  fontWeight: FontWeight.w400,
                                ),
                                isForce2Digits: true,
                                highlightedTextStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColorUtils.GREEN_TEXT,
                                  decorationStyle: TextDecorationStyle.solid,
                                  inherit: true,
                                  fontWeight: FontWeight.w500,
                                ),
                                spacing: 15.sp,
                                itemHeight: 40,
                                onTimeChange: (time) {
                                  _time = time;
                                  // setState(
                                  //       () {
                                  //     _time = DateTime(
                                  //       time.month,
                                  //       time.month,
                                  //       time.day,
                                  //       time.hour < 8 ? time.hour + 16 : time.hour,
                                  //       time.minute,
                                  //     );
                                  //
                                  //     // print(_time);
                                  //   },
                                  // );
                                },
                              ),
                            ),
                            Container(
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
                                  backgroundColor: AppColorUtils.WHITE,
                                  itemTextStyle: TextStyle(
                                    color: AppColorUtils.GREEN_TEXT,
                                    fontSize: 16.sp,
                                  ),
                                  dividerColor: AppColorUtils.DIVIDER_COLOR,
                                ),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(
                          vertical: 10.w,
                          horizontal: 18,
                        ),
                      ).paddingOnly(
                        left: 25,
                        right: 25,
                        bottom: 15.w,
                      ),
                      Column(
                        children: [
                          AppWidgets.appButton(
                            height: 48.w,
                            onTap: () async {
                              var dateTime = DateTime(
                                _date.year,
                                _date.month,
                                _date.day,
                                _time.hour,
                                _time.minute,
                              );
                              // cubit.openItem(index);
                              cubit.addDbVolunteerItem(index, dateTime);
                              NotificationCubit.to..getList();
                              NavigatorService.to.pop();
                              await showDialog(
                                context: context,
                                builder: (context) => ItemAddingSuccess(
                                  dateTime: _date,
                                  time: _time,
                                  back: () {
                                    Navigator.pop(context);
                                  },
                                  goto: () {
                                    NavigatorService.to.pushReplacementNamed(
                                      NotificationPage.routeName,
                                    );
                                  },
                                ),
                              );
                            },
                            title: LocaleKeys.save,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 12.h),
                          AppWidgets.appButton(
                            height: 48.w,
                            color: AppColorUtils.LIGHT_GRAY,
                            textColor: AppColorUtils.BLACK,
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
                        bottom: 15.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
