import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/services/notification_api_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'notification_date_widget.dart';
import 'notification_delete_widget.dart';
import 'notification_edit.dart';

class MyNoteWidget extends StatelessWidget {
  MyNoteWidget({
    required this.model,
    required this.index,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final VolunteerDbModel model;
  final int index;
  final NotificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColorUtils.ITEM_ORDERS_BORDER,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      text: LocaleKeys.project_name,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.ITEM_ORDERS_TEXT2,
                    ).paddingOnly(bottom: 3.w),
                    InkWell(
                      child: SvgPicture.asset(
                        AppImageUtils.EDIT_DEMO,
                        color: AppColorUtils.KRAUDFANDING,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return NotificationEdit(
                              cubit: cubit,
                              selectFunction: (dateTime) {},
                              model: model,
                              index: index,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  width: 260.w,
                  child: AppWidgets.text(
                    text: model.title ?? "",
                    height: 1.3,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColorUtils.DARK2,
                    maxLines: 2,
                  ),
                ),
                AppWidgets.textLocale(
                  text: LocaleKeys.note_time,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.ITEM_ORDERS_TEXT2,
                ).paddingOnly(
                  top: 12.w,
                  bottom: 3,
                ),
                NotificationDateWidget(date: model.modifiedAt!),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.starTextWidget(
                      text: LocaleKeys.date_of_completion,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.ITEM_ORDERS_TEXT2,
                    ).paddingOnly(bottom: 4.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppWidgets.imageSvg(
                              path: AppImageUtils.CALENDAR_RED,
                              color: AppColorUtils.GREY_BLACK,
                              height: 12.w,
                            ).paddingOnly(right: 5),
                            AppWidgets.textLocale(
                              text: DateFormat("dd.MM.yyyy").format(
                                DateTime.parse(model.deadLine!),
                              ),
                              color: AppColorUtils.KRAUDFANDING,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ).paddingOnly(right: 24.w),
                          ],
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            AppImageUtils.TRASH,
                            color: AppColorUtils.RED,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return NotificationDeleteWidget(
                                  index: index,
                                  cubit: cubit,
                                  model: model,
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ).paddingOnly(
                  top: 12.w,
                  bottom: 3.w,
                ),
              ],
            ).paddingAll(10.w),
          ],
        ),
      )
          .paddingSymmetric(
            horizontal: 20.w,
          )
          .paddingOnly(
            top: 5.w,
            bottom: 8.w,
          ),
    );
  }
}
