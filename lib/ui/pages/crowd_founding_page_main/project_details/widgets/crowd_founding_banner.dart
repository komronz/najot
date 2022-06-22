import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/services/navigator_service.dart';
import '../../../home_page/home_page.dart';

class CrowdFoundingBanner extends StatelessWidget {
  const CrowdFoundingBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 163.w,
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColorUtils.backAd,
        border: Border.all(
          width: 1,
          color: AppColorUtils.divider,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(AppImageUtils.splash2),
          ),
          SizedBox(width: 14.w),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(
              top: 20.w,
              bottom: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.text(
                  text: LocaleKeys.have_idea.tr(),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  color: AppColorUtils.textGrey,
                ),
                SizedBox(height: 10.w),
                AppWidgets.text(
                  text: LocaleKeys.we_help_you.tr(),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  maxLines: 1,
                  color: AppColorUtils.textGrey,
                ),
                SizedBox(height: 20.w),
                ButtonCard(
                  onPress: () {
                    NavigatorService.to.pushNamedAndRemoveUntil(
                      HomePage.routeName,
                      arguments: AppPageType.addProject,
                    );
                  },
                  height: 35.w,
                  width: 146.w,
                  text: LocaleKeys.add_project.tr(),
                  color: AppColorUtils.percentColor,
                  textColor: AppColorUtils.white,
                  textSize: 12.sp,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
