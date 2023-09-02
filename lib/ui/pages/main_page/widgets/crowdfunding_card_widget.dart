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
        onTap: onTap,
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
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          imageUrl: projectModel.cover ?? "",
                          errorWidget: (context, url, error) => Image.asset(
                            AppImageUtils.Splash2,
                          ),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.w),
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
                              lineHeight: 10.h,
                              animationDuration: 2000,
                              percent: (projectModel.percent ?? 0) / 100,
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
                                    AppWidgets.textLocale(
                                      text: Format.moneyFormat(double.parse(projectModel.amountCollected??"0")),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorUtils.GREEN_TEXT,
                                    ),
                                    const SizedBox(
                                      height: 2,
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
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    AppWidgets.text(
                                      text: "${projectModel.percent ?? 0}%",
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
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onTapLike,
                  child: projectModel.isFavourite ?? false
                      ? SvgPicture.asset(AppImageUtils.LIKE)
                      : SvgPicture.asset(AppImageUtils.UNLIKE),
                ),
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
        ));
  }
}
