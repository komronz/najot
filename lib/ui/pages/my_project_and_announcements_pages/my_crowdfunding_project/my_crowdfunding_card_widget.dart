import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/crowd_founding_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../home_page/widget/button_card_widget.dart';
import 'my_crowdfunding_about_widget.dart';

class MyCrowdfundingList extends StatelessWidget {
  const MyCrowdfundingList({
    required this.cardModel,
    required this.visible,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final CrowdFoundingModel cardModel;
  final bool visible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(11, 191, 144, 0.08),
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
        ),
        height: 298.w,
        width: 175.w,
        child: Stack(
          children: [
            Column(
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
                      imageUrl: cardModel.imgUrl!,
                      errorWidget: (context, url, error) => Image.asset(
                        AppImageUtils.splash2,
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      fit: BoxFit.cover,
                    ),
                    // child: Image.asset(
                    //   cardModel.image,
                    //   fit: BoxFit.cover,
                    //   width: MediaQuery.of(context).size.width,
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12, top: 12, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.text(
                          text: cardModel.title!,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        ).paddingOnly(bottom: 12.w),
                        Row(
                          children: [
                            AppWidgets.textLocale(
                              text: "${LocaleKeys.done.tr()}:",
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColorUtils.dark6,
                            ).paddingOnly(right: 5.w),
                            AppWidgets.text(
                              text: "60%",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorUtils.bluePercent,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 13),
                          child: LinearPercentIndicator(
                            animation: true,
                            padding: const EdgeInsets.all(0),
                            animationDuration: 2000,
                            percent: 0.60,
                            progressColor: AppColorUtils.percentColor,
                            backgroundColor: AppColorUtils.percentColor2,
                          ),
                        ).paddingOnly(bottom: 10.w),
                        AppWidgets.starTextWidget(
                            text: LocaleKeys.must_collected_date.tr()),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: AppColorUtils.bluePercent,
                              size: 12.sp,
                            ),
                            AppWidgets.text(
                              text: cardModel.createdDate!,
                              color: AppColorUtils.bluePercent,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ).paddingOnly(left: 6.w),
                          ],
                        ).paddingOnly(top: 7.w)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: visible,
              child: ButtonCard(
                onPress: () {},
                text: LocaleKeys.technology,
                visibleIcon: false,
                borderRadius: 20,
                height: 24.w,
                width: 77.w,
                textColor: AppColorUtils.greenText,
                textSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ).paddingAll(10.w),
            )
          ],
        ),
      ),
      onTap: () {
        NavigatorService.to.pushNamed(
          MyCrowdfundingAboutWidget.routeName,
          arguments: cardModel,
        );
      },
    );
  }
}
