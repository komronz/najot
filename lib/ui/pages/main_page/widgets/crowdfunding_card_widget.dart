import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/data/utils/app_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CrowdfundingCardWidget extends StatelessWidget {
  CrowdfundingCardWidget({
    required this.projectModel,
    required this.visible,
    required this.onTap,
    required this.onTapLike,
  });

  final ProjectModel projectModel;
  final bool visible;
  final VoidCallback onTap;
  final VoidCallback onTapLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 300.w,
          width: 220.w,
          child: Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
                color: AppColorUtils.WHITE,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          imageUrl: projectModel.cover!,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImageUtils.Splash2,
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppWidgets.text(
                              text: projectModel.title ?? "",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              maxLines: 2,
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              padding: EdgeInsets.all(0),
                              lineHeight: 10.h,
                              animationDuration: 2000,
                              percent: projectModel.percent! / 100,
                              progressColor: AppColorUtils.PERCENT_COLOR,
                              backgroundColor: AppColorUtils.PERCENT_COLOR2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.collected,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: AppColorUtils.DARK6,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    AppWidgets.textLocale(
                                      text: Format.moneyFormat(double.parse(projectModel.amountCollected!)),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorUtils.GREEN_TEXT,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.done,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: AppColorUtils.DARK6,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    AppWidgets.text(
                                      text: "${projectModel.percent}%",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorUtils.BLUE_PERCENT,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Align(
                child: InkWell(
                  child: projectModel.isFavourite!
                      ? SvgPicture.asset(AppImageUtils.LIKE)
                      : SvgPicture.asset(AppImageUtils.UNLIKE),
                  onTap: onTapLike,
                ),
                alignment: Alignment.topRight,
              ).paddingAll(15),
              Visibility(
                visible: visible,
                child: ButtonCard(
                  onPress: () {},
                  text: LocaleKeys.technology.tr(),
                  visibleIcon: false,
                  borderRadius: 20,
                  height: 24.h,
                  width: 77.w,
                  textColor: AppColorUtils.GREEN_TEXT,
                  textSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ).paddingAll(15),
              )
            ],
          ),
        ),
        onTap: onTap);
  }
}