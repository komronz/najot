import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class CharityFullPage extends StatelessWidget {
  final CharityModel model;

  const CharityFullPage({
    required this.model,
    Key? key,
  }) : super(key: key);
  static const String routName = 'charityFullPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTitle(
        title: "E'lon",
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      backgroundColor: AppColorUtils.BACKGROUND,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.width,
              decoration: DecorationConst.DEC_WITH_SHADOW,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: context.width,
                        height: 308.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: CachedNetworkImage(
                            imageUrl: model.imgUrl!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ).paddingSymmetric(horizontal: 20, vertical: 20),
                      ),
                      Positioned(
                        bottom: 53,
                        right: 0,
                        child: Container(
                          height: 35.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: AppColorUtils.BLUE_PERCENT,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppWidgets.text(
                    text: model.title!,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColorUtils.DARK2,
                    maxLines: 10,
                  ).paddingSymmetric(horizontal: 20),
                  CharityAuthorWidget(model: model).paddingOnly(top: 18.w),
                  CharityPriceWidget(model: model).paddingOnly(top: 18.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppliedUserWidgets(model: model),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.starTextWidget(
                            text: "Sanagacha to'planishi kerak",
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: AppColorUtils.BLUE_PERCENT,
                                size: 14.sp,
                              ),
                              AppWidgets.text(
                                text: model.createdDate!,
                                color: AppColorUtils.BLUE_PERCENT,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ).paddingOnly(left: 6),
                            ],
                          ).paddingOnly(top: 3)
                        ],
                      ).paddingOnly(left: 30)
                    ],
                  ).paddingSymmetric(horizontal: 20, vertical: 18.w)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppliedUserWidgets extends StatelessWidget {
  final CharityModel model;

  const AppliedUserWidgets({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          text: "Odam qo'lladi",
          color: AppColorUtils.DARK_6,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImageUtils.DEF_PERSON),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImageUtils.DEF_PERSON),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(model.imgUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            AppWidgets.text(
              text: "+${model.applied!}",
              color: AppColorUtils.TEXT_GREEN2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ).paddingOnly(left: 3),
          ],
        ).paddingOnly(top: 3)
      ],
    );
  }
}

class CharityPriceWidget extends StatelessWidget {
  final CharityModel model;

  const CharityPriceWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(text: "Lozim bo'lgan summa"),
                AppWidgets.text(
                  text: model.totalSum!,
                  color: Color(0xFF043F3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 3.w),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.textLocale(
                  text: "E'lon berigan kun",
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColorUtils.DARK_6,
                ),
                AppWidgets.text(
                  text: model.createdDate!,
                  color: Color(0xFF043F3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 3.w),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20),
        Container(
          width: context.width,
          color: AppColorUtils.GREEN_BACK,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: "To'plandi",
                    color: AppColorUtils.DARK_6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  AppWidgets.textLocale(
                    text: "Bajarildi",
                    color: AppColorUtils.DARK_6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: LocaleKeys.sum,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.GREEN_TEXT,
                    args: [model.currentSum!],
                  ),
                  AppWidgets.text(
                    text: "${model.percent.toString().split('.').first} %",
                    color: AppColorUtils.BLUE_PERCENT,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ],
              ).paddingOnly(top: 3),
              LinearPercentIndicator(
                animation: true,
                padding: EdgeInsets.all(0),
                lineHeight: 10.h,
                animationDuration: 2000,
                percent: model.percent! / 100,
                progressColor: AppColorUtils.PERCENT_COLOR,
                backgroundColor: AppColorUtils.PERCENT_COLOR2,
              ).paddingOnly(top: 10.w),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 12.w,
          ),
        ).paddingOnly(top: 12.w),
        Container(
          decoration: DecorationConst.DEC_WITH_SHADOW,
        )
      ],
    );
  }
}

class CharityAuthorWidget extends StatelessWidget {
  final CharityModel model;

  const CharityAuthorWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(model.imgUrl!), fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  text: "E'lon muallifi",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_6,
                ),
                SizedBox(
                  width: 150.w,
                  child: AppWidgets.text(
                    text: model.author!,
                    color: AppColorUtils.TEXT_GREEN2,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ).paddingOnly(top: 2.w),
                ),
              ],
            ).paddingOnly(left: 10),
          ],
        ),
        ButtonCard(
          onPress: () {},
          text: "Savol berish",
          width: 100.w,
          height: 35.w,
          color: AppColorUtils.GREEN_BTN,
          textColor: AppColorUtils.GREEN_TEXT,
          borderRadius: 10,
          textSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
