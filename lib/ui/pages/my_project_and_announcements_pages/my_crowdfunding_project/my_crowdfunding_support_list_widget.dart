import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';

class MyCrowdfundingSupportListWidget extends StatelessWidget {

  final List<KraufandingModel> list;

  const MyCrowdfundingSupportListWidget({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      body: Container(
        width: context.width,
        color: AppColorUtils.WHITE,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.name,
                  color: AppColorUtils.GRAY_4,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                AppWidgets.textLocale(
                  text: LocaleKeys.date,
                  color: AppColorUtils.GRAY_4,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                AppWidgets.textLocale(
                  text: LocaleKeys.total.tr() + "(so'm)",
                  color: AppColorUtils.GRAY_4,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ).paddingOnly(
              top: 15.w,
              right: 20.w,
              left: 20.w,
            ),
            Divider(
              thickness: 2,
            ).paddingOnly(
              bottom: 8.w,
              right: 20.w,
              left: 20.w,
            ),
            if (!list.isEmpty)
              Expanded(
                flex: 8,
                child: Container(
                  height: 550.w,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (list[index].author != null) {
                        return SupportListWidget(
                          model: list[index],
                        );
                      }
                      return SizedBox();
                    },
                    itemCount: list.length,
                  ),
                ).paddingSymmetric(horizontal: 20.w),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppWidgets.imageSvg(
                    path: AppImageUtils.CHARITY_HAND,
                    height: 70.w,
                    width: 70.w,
                    fit: BoxFit.none,
                  ).paddingOnly(top: 80.w),
                  AppWidgets.textLocale(
                          text: LocaleKeys.nothing_found_yet,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColorUtils.GRAY_4,
                          maxLines: 2,
                          textAlign: TextAlign.center)
                      .paddingOnly(
                    top: 20.w,
                    right: 55.w,
                    left: 55.w,
                  ),
                ],
              ),
            Visibility(
              visible: !list.isEmpty?true:false,
              child: Flexible(
                child: Container(
                  height: 73.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorUtils.WHITE,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(11, 191, 144, 0.08),
                        blurRadius: 15,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.starTextWidget(
                            text: LocaleKeys.must_collected_date.tr(),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: AppColorUtils.BLUE_PERCENT,
                                size: 14.sp,
                              ),
                              AppWidgets.text(
                                text: "25.02.2022",
                                color: AppColorUtils.BLUE_PERCENT,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ).paddingOnly(left: 6.w),
                            ],
                          ).paddingOnly(top: 5.w),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppWidgets.textLocale(
                              text: LocaleKeys.collected,
                              color: AppColorUtils.DARK_6,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            AppWidgets.textLocale(
                                text: LocaleKeys.sum,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.GREEN_TEXT,
                                args: ["10 000 000"]),
                          ],
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20),
                ),
              ),
            ),
          ],
        ).paddingOnly(top: 5.h),
      ),
    );
  }
}

class SupportListWidget extends StatelessWidget {
  final KraufandingModel model;

  const SupportListWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(bottom: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    height: 18.w,
                    width: 18.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            model.imgUrl!,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: AppWidgets.text(
                      text: model.author!,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColorUtils.DARK2,
                    ).paddingOnly(left: 4.w),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: AppWidgets.text(
                  text: model.createdDate!,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColorUtils.DARK6,
                  maxLines: 2,
                  textAlign: TextAlign.right),
            ),
            Expanded(
              flex: 3,
              child: AppWidgets.text(
                  text: "+${'10 000 000'} so'm",
                  color: AppColorUtils.TEXT_GREEN,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.right),
            )
          ],
        ),
      ),
    );
  }
}
