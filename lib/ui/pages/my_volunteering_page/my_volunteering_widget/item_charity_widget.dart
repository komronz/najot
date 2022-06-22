import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
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
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 10),
      width: 335.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppColorUtils.gray3,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 278.w,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: model.imgUrl!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ).paddingOnly(bottom: 12),
          AppWidgets.textLocale(
            text: model.title!,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColorUtils.dark2,
            maxLines: 2,
          ).paddingOnly(
            bottom: 18,
            right: 6,
            left: 6,
          ),
          AppWidgets.starTextWidget(
                  text: LocaleKeys.item_type,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.gray4)
              .paddingOnly(
            bottom: 4,
            right: 6,
            left: 6,
          ),
          AppWidgets.textLocale(
            text: model.typeVolunteering!,
            color: AppColorUtils.greenText,
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
                      text: LocaleKeys.address,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.gray4,
                    ).paddingOnly(bottom: 4),
                    AppWidgets.textLocale(
                      text: model.address!,
                      color: AppColorUtils.blueText,
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
                                text: LocaleKeys.executable_date,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.gray4)
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
                            path: AppImageUtils.calendarRed,
                            height: 12.sp,
                          ).paddingOnly(right: 5),
                          AppWidgets.textLocale(
                            text: model.completedDate!,
                            color: AppColorUtils.red,
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
                  text: LocaleKeys.phone_number,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.gray4)
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
                  color: AppColorUtils.addProjectColor,
                ),
                child: Row(
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.icPhone,
                      color: AppColorUtils.blueText,
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
                          padding: const EdgeInsets.all(2),
                          height: 14.w,
                          width: 14.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColorUtils.greenAccent1,
                          ),
                          child: SvgPicture.asset(
                            AppImageUtils.checkSmall,
                            color: AppColorUtils.greenText10,
                          ),
                        ).paddingOnly(right: 6)
                      : const SizedBox(),
                  model.isDone!
                      ? AppWidgets.imageSvg(
                          path: AppImageUtils.notificationGrey)
                      : AppWidgets.imageSvg(path: AppImageUtils.notification),
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
