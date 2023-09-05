import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/data/extensions/widget_padding_extension.dart';
import '/data/localization/locale_keys.g.dart';
import '/data/model/project_model.dart';
import '/data/utils/app_color_utils.dart';
import '/data/utils/app_image_utils.dart';
import '/ui/widgets/app_widgets.dart';

class CharityCardWidget extends StatelessWidget {
  CharityCardWidget({
    required this.projectModel,
    required this.onTap,
    required this.onTapLike,
  });

  final ProjectModel projectModel;
  final VoidCallback onTap;
  final VoidCallback onTapLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
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
                          imageUrl: projectModel.cover!,
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
                              padding: const EdgeInsets.all(0),
                              lineHeight: 10.h,
                              animationDuration: 2000,
                              percent: projectModel.percent! / 100,
                              progressColor: AppColorUtils.PERCENT_COLOR,
                              backgroundColor: AppColorUtils.PERCENT_COLOR2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppWidgets.textLocale(
                                  text: LocaleKeys.item_type,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                  color: AppColorUtils.DARK6,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                AppWidgets.text(
                                  text: projectModel.title??"",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorUtils.BLUE_PERCENT,
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
                  child: projectModel.isFavourite!
                      ? SvgPicture.asset(AppImageUtils.LIKE)
                      : SvgPicture.asset(AppImageUtils.UNLIKE),
                ),
              ).paddingAll(15),
            ],
          ),
        ));
  }
}
