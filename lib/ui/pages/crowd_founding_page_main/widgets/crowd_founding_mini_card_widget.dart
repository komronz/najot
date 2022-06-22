import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/card_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../home_page/widget/button_card_widget.dart';
import '../project_details/project_details_page.dart';

class CrowdFoundingMiniCardWidget extends StatelessWidget {
  const CrowdFoundingMiniCardWidget(
      {required this.cardModel, required this.visible, Key? key})
      : super(key: key);
  final CardModel cardModel;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 267.w,
        width: 162.w,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 1,
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
                        imageUrl: cardModel.image!,
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
                      margin: const EdgeInsets.only(
                        left: 12,
                        top: 12,
                        right: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.text(
                            text: cardModel.title!,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
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
                          ),
                          SizedBox(height: 20.w),
                          Container(
                            child: AppWidgets.textLocale(
                              text: LocaleKeys.done,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColorUtils.dark6,
                            ),
                          ),
                          SizedBox(height: 5.w),
                          Container(
                            child: AppWidgets.text(
                              text: "60%",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorUtils.bluePercent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                cardModel.isFavorite!
                    ? AppImageUtils.like
                    : AppImageUtils.unlike,
              ),
            ).paddingAll(12.w),
            Visibility(
              visible: visible,
              child: ButtonCard(
                width: 70.w,
                onPress: () {},
                text: LocaleKeys.technology.tr(),
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
          ProjectDetailsPage.routeName,
          arguments: cardModel,
        );
      },
    );
  }
}
