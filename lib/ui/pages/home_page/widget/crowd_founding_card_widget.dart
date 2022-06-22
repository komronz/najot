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
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class KraudfandingCardWidget extends StatelessWidget {
  const KraudfandingCardWidget({
    Key? key,
    required this.projectModel,
    required this.visible,
  }) : super(key: key);

  final ProjectModel projectModel;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 300.w,
        width: 220.w,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              color: AppColorUtils.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: projectModel.cover!,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageUtils.splash2,
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
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppWidgets.text(
                            text: projectModel.title!,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            padding: const EdgeInsets.all(0),
                            lineHeight: 10.h,
                            animationDuration: 2000,
                            percent: 0.45,
                            progressColor: AppColorUtils.percentColor,
                            backgroundColor: AppColorUtils.percentColor2,
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
                                    color: AppColorUtils.dark6,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.sum,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColorUtils.greenText,
                                    args: ["${projectModel.requiredFund}"],
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
                                    color: AppColorUtils.dark6,
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  AppWidgets.text(
                                    text: "60%",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColorUtils.bluePercent,
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
              child: SvgPicture.asset(AppImageUtils.like),
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
                textColor: AppColorUtils.greenText,
                textSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ).paddingAll(15),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
