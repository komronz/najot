import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/kraufanding_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../main_page/widgets/button_card_widget.dart';
import 'my_crowdfunding_about_widget.dart';

class MyCrowdfundingList extends StatelessWidget {
  MyCrowdfundingList(
      {required this.cardModel, required this.visible, Key? key, required this.onTap})
      : super(key: key);
  final ProjectModel cardModel;
  final bool visible;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    var createdAt= DateTime.parse(cardModel.createdAt!);

    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: cardModel.coverUrl!,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageUtils.Splash2,
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                      ),
                      // child: Image.asset(
                      //   cardModel.image,
                      //   fit: BoxFit.cover,
                      //   width: MediaQuery.of(context).size.width,
                      // ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 12, top: 12, right: 5),
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
                                text: LocaleKeys.done.tr()+":",
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: AppColorUtils.DARK6,
                              ).paddingOnly(right: 5.w),
                              AppWidgets.text(
                                text: "${cardModel.percent}%",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.BLUE_PERCENT,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 13),
                            child: LinearPercentIndicator(
                              animation: true,
                              padding: EdgeInsets.all(0),
                              animationDuration: 2000,
                              percent: cardModel.percent!/100,
                              progressColor: AppColorUtils.PERCENT_COLOR,
                              backgroundColor: AppColorUtils.PERCENT_COLOR2,
                            ),
                          ).paddingOnly(bottom: 10.w),
                          AppWidgets.starTextWidget(text: LocaleKeys.must_collected_date.tr()),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: AppColorUtils.BLUE_PERCENT,
                                size: 12.sp,
                              ),
                              AppWidgets.text(
                                text: DateFormat("dd.MM.yyyy").format(createdAt),
                                color: AppColorUtils.BLUE_PERCENT,
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
                textColor: AppColorUtils.GREEN_TEXT,
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
