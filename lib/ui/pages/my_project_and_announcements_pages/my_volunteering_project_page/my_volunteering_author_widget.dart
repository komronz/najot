

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_image_utils.dart';

class MyVolunteeringAuthorWidget extends StatelessWidget {
  final ProjectModel model;
  final VoidCallback onTap;

  const MyVolunteeringAuthorWidget({
    required this.model,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                shape : BoxShape.circle,
                color: Colors.black12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.w),
                child: CachedNetworkImage(
                  imageUrl: model.owner!.photo!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.person),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(
                  text: LocaleKeys.volunteer.tr(),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_6,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      height: 13.w,
                      width: 13.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFE8FEF2),
                      ),
                      child: SvgPicture.asset(
                        AppImageUtils.CHECK_SMALL,
                        color: Color(0xFF038D69),
                      ).paddingAll(0.3),
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: model.owner!.firstName!,
                      fontSize: 14.sp,
                      color: AppColorUtils.TEXT_GREEN,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ).paddingOnly(left: 10),
          ],
        ),
        ButtonCard(
          onPress: onTap,
          iconColor: AppColorUtils.KRAUDFANDING,
          addIcon: AppImageUtils.IC_PHONE,visibleIcon: true,
          text: LocaleKeys.connection.tr(),
          width: 110.w,
          height: 35.w,
          color: AppColorUtils.GREEN_BTN,
          textColor: AppColorUtils.GREEN_TEXT,
          borderRadius: 10,
          textSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}