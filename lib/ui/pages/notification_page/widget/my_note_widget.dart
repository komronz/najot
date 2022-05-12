import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'notification_delete_widget.dart';
import 'notification_edit.dart';

class MyNoteWidget extends StatelessWidget {
  MyNoteWidget({
    required this.model,
    required this.onTap,
    Key? key,
    this.isLast = false,
  }) : super(key: key);
  final VolunteeringModel model;
  final VoidCallback onTap;
  bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: isLast ? AppColorUtils.ITEM_ORDERS_CARD : AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColorUtils.ITEM_ORDERS_BORDER,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.project_name,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.ITEM_ORDERS_TEXT2,
                ).paddingOnly(bottom: 3.w),
                Container(
                  width: 260.w,
                  child: AppWidgets.text(
                    text: model.title!,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.CALENDAR_RED,
                      color: AppColorUtils.BLUE_PERCENT,
                      height: 15.w,
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: model.completedDate!,
                      color: AppColorUtils.BLUE_PERCENT,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ).paddingOnly(right: 24.w),
                    AppWidgets.imageSvg(
                      path: AppImageUtils.CLOCK,
                      color: AppColorUtils.BLUE_PERCENT,
                      height: 15.w,
                    ).paddingOnly(
                      right: 5.w,
                      top: 2.w,
                    ),
                    AppWidgets.textLocale(
                      text: "18:00",
                      color: AppColorUtils.BLUE_PERCENT,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
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
                      children: [
                        AppWidgets.imageSvg(
                          path: AppImageUtils.CALENDAR_RED,
                          color: AppColorUtils.GREY_BLACK,
                          height: 12.w,
                        ).paddingOnly(right: 5),
                        AppWidgets.textLocale(
                          text: model.completedDate!,
                          color: AppColorUtils.KRAUDFANDING,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ).paddingOnly(right: 24.w),
                      ],
                    ),
                  ],
                ).paddingOnly(
                  top: 12.w,
                  bottom: 3.w,
                ),
              ],
            ).paddingAll(12),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            selectFunction: (dateTime) {},
                            model: model,
                          );
                        },
                      );
                    },
                  ).paddingOnly(
                    top: 15.w,
                    right: 15.w,
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
                          return NotificationDeleteWidget();
                        },
                      );
                    },
                  ).paddingOnly(
                    top: 120.w,
                    right: 15.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 20).paddingOnly(top: 12.w),
      onTap: onTap,
      //     (){
      //   widget.onTap;
      //   setState(() {
      //     widget.isLast = false;
      //   });
      // }
    );
  }
}
