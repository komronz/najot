import 'package:flutter/cupertino.dart';
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

class KraudfandingMiniCardWidget extends StatelessWidget {
  KraudfandingMiniCardWidget({
    required this.cardModel,
    required this.visible, Key? key}) : super(key: key);
  final CardModel cardModel;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 267.h,
        width: 162.w,
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
                      // child: CachedNetworkImage(
                      //   width: double.infinity,
                      //   imageUrl: productModel.photo!.image!,
                      //   errorWidget: (context, url, error) => Image.asset(
                      //     AppImageUtils.APP_LOGO,
                      //   ),
                      //   placeholder: (context, url) =>
                      //       Center(child: CircularProgressIndicator()),
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image.asset(
                        cardModel.image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 12,top: 12, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.text(
                            text:cardModel.title,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 13),
                            child: LinearPercentIndicator(
                              animation: true,
                              padding: EdgeInsets.all(0),
                              lineHeight: 6.h,
                              animationDuration: 2000,
                              percent: 0.60,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: AppColorUtils.PERCENT_COLOR,
                              backgroundColor: AppColorUtils.PERCENT_COLOR2,
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Container(
                            child: AppWidgets.textLocale(
                              text: LocaleKeys.done,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: AppColorUtils.DARK6,
                              ),
                              ),
                          SizedBox(height: 2.h),
                          Container(child: AppWidgets.text(
                                text: "60%",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.BLUE_PERCENT)),



                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: SvgPicture.asset(cardModel.isFavorite?AppImageUtils.LIKE:AppImageUtils.UNLIKE),
              alignment: Alignment.topRight,
            ).paddingAll(15),
            Visibility(
              visible: visible,
              child: ButtonCard(
                onPress: () {},
                text: "Texnologiya",
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
      onTap: () {
        NavigatorService.to.pushNamedAndRemoveUntil(ProjectDetailsPage.routeName);
      },
    );
  }

}




