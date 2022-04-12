import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/model/volunteering_model.dart';
import 'item_charity_date_picker_widget.dart';

class ItemCharityWidget extends StatelessWidget {
  final VolunteeringModel model;

  const ItemCharityWidget({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 10),
      width: 335.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: Color(0xFFE6E7E8),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 278.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: model.imgUrl!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ).paddingOnly(bottom: 12),
          AppWidgets.textLocale(
            text: model.title!,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF414042),
            maxLines: 2,
          ).paddingOnly(
            bottom: 18,
            right: 6,
            left: 6,
          ),
          AppWidgets.starTextWidget(
                  text: "Buyum turi",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.GRAY_4)
              .paddingOnly(
            bottom: 4,
            right: 6,
            left: 6,
          ),
          AppWidgets.textLocale(
            text: model.typeVolunteering!,
            color: AppColorUtils.GREEN_TEXT,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ).paddingOnly(
            bottom: 13,
            right: 6,
            left: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                        text: "Manzil",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.GRAY_4,
                      ).paddingOnly(bottom: 4),
                      AppWidgets.textLocale(
                        text: model.address!,
                        color: AppColorUtils.BLUE_TEXT,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                    ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppWidgets.starTextWidget(
                                text: "Bajariladigan sana",
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.GRAY_4)
                            .paddingOnly(
                          bottom: 4,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => ItemCharityDatePickerWidget(
                            selectFunction: (dateTime) {
                              // print(dateTime.toUtc().toString());
                              // bloc.add(VolunteerBirthDateSelected(dateTime));
                            },
                            model: model,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppWidgets.imageSvg(
                            path: AppImageUtils.CALENDAR_RED,
                            height: 12.sp,
                          ).paddingOnly(right: 5),
                          AppWidgets.textLocale(
                            text: model.completedDate!,
                            color: AppColorUtils.RED,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingOnly(
            bottom: 11,
            right: 6,
            left: 6,
          ),
          AppWidgets.starTextWidget(
                  text: "Telefon raqam",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.GRAY_4)
              .paddingOnly(
            bottom: 4,
            right: 6,
            left: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFEAF2FF),
                ),
                child: Row(
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.IC_PHONE,
                      color: AppColorUtils.BLUE_TEXT,
                    ).paddingOnly(right: 5),
                    AppWidgets.text(
                      text: model.mobileNumber!,
                      fontSize: 14.sp,
                    ),
                  ],
                ).paddingOnly(
                  left: 10,
                  right: 10,
                ),
              ),
              Row(
                children: [
                  model.isDone!
                      ? Container(
                          padding: EdgeInsets.all(2),
                          height: 14.w,
                          width: 14.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFE8FEF2),
                          ),
                          child: SvgPicture.asset(
                            AppImageUtils.CHECK_SMALL,
                            color: Color(0xFF038D69),
                          ),
                        ).paddingOnly(right: 6)
                      : SizedBox(),
                  model.isDone!
                      ? AppWidgets.imageSvg(
                          path: AppImageUtils.NOTIFICATION_GREY)
                      : AppWidgets.imageSvg(path: AppImageUtils.NOTIFICATION),
                ],
              ),
            ],
          ).paddingOnly(
            right: 6,
            left: 6,
            bottom: 8,
          ),
        ],
      ),
    );
  }
}
