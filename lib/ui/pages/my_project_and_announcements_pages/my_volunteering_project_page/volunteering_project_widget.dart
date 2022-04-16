import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/about_my_volunteering_project_page.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class VolunteeringProjectWidget extends StatelessWidget {
  final VolunteeringModel model;
  final VoidCallback onTap;

  const VolunteeringProjectWidget({
    required this.model,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        width: 175.w,
        height: 298.w,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: model.imgUrl!,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: model.title!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.support_type,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(
                    top: 11.h,
                    bottom: 3.h,
                  ),
                  AppWidgets.text(
                    text: model.typeVolunteering!,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.GREEN_TEXT,
                  ).paddingOnly(
                    top: 3.w,
                    bottom: 11.h,
                  ),
                  AppWidgets.starTextWidget(
                    text: LocaleKeys.volunteering.tr(),
                    fontSize: 10.sp,
                  ).paddingOnly(
                    bottom: 3.h,
                  ),
                  model.volunteerName == null
                      ? Row(
                          children: [
                            Container(
                              width: 11.w,
                              height: 11.w,
                              child: CircularProgressIndicator(
                                color: Color(0xFFE8B811),
                                backgroundColor: AppColorUtils.WHITE,
                                strokeWidth: 2,
                              ),
                            ).paddingOnly(right: 5),
                            AppWidgets.textLocale(
                              text: LocaleKeys.expected,
                              fontSize: 12.sp,
                              color: Color(0xFFE8B811),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              height: 12.w,
                              width: 12.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFFE8FEF2),
                              ),
                              child: SvgPicture.asset(
                                AppImageUtils.CHECK_SMALL,
                                color: Color(0xFF038D69),
                              ).paddingAll(0.2),
                            ).paddingOnly(right: 5),
                            AppWidgets.textLocale(
                              text: model.volunteerName!,
                              fontSize: 12.sp,
                              color: AppColorUtils.TEXT_GREEN,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                ],
              ).paddingSymmetric(
                vertical: 14,
                horizontal: 12,
              ),
              flex: 1,
            )
          ],
        ),
      ),
      onTap: (){
        NavigatorService.to.pushNamed(
          AboutMyVolunteeringItemProjectWidget.routeName,
            arguments: model,
        );
      },
    );
  }
}
