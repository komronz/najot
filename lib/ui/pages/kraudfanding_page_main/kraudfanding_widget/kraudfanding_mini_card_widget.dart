import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/kraudfanding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../main_page/widgets/button_card_widget.dart';
import '../project_details/project_details_page.dart';

class KraudfandingMiniCardWidget extends StatelessWidget {
  KraudfandingMiniCardWidget(
      {required this.cardModel, required this.visible, required this.cubit});

  final ProjectModel cardModel;
  final bool visible;
  final CrowdfundingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 267.w,
        width: 162.w,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 1,
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
                        imageUrl: cardModel.cover ?? "",
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
                      margin: EdgeInsets.only(
                        left: 12,
                        top: 12,
                        right: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.text(
                            text: cardModel.title ?? "",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
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
                          ),
                          SizedBox(height: 20.w),
                          Container(
                            child: AppWidgets.textLocale(
                              text: LocaleKeys.done,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColorUtils.DARK6,
                            ),
                          ),
                          SizedBox(height: 5.w),
                          Container(
                            child: AppWidgets.text(
                              text: "${cardModel.percent}%",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorUtils.BLUE_PERCENT,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                cubit.changeLike(cardModel.id!);
              },
              child: Align(
                child: cardModel.isFavourite!
                    ? SvgPicture.asset(AppImageUtils.LIKE)
                    : SvgPicture.asset(AppImageUtils.UNLIKE),
                alignment: Alignment.topRight,
              ).paddingAll(12.w),
            ),
            Visibility(
              visible: visible,
              child: ButtonCard(
                width: 70.w,
                onPress: () {},
                text: LocaleKeys.technology.tr(),
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
          ProjectDetailsPage.routeName,
          arguments: CrowdfundingDetailModel(
            cubit: cubit,
            cardModel: cardModel,
          ),
        );
      },
    );
  }
}
