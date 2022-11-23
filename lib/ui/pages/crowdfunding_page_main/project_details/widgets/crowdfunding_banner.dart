import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/services/navigator_service.dart';
import '../../../home_page/home_page.dart';

class CrowdfundingBanner extends StatelessWidget {
  const CrowdfundingBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 163.w,
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColorUtils.BACK_AD,
        border: Border.all(
          width: 1,
          color: AppColorUtils.DIVIDER,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(AppImageUtils.Splash2),
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
                  color: AppColorUtils.TEXT_GREY,
                ),
                SizedBox(height: 10.w),
                AppWidgets.text(
                  text: LocaleKeys.we_help_you.tr(),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  maxLines: 1,
                  color: AppColorUtils.TEXT_GREY,
                ),
                SizedBox(height: 20.w),
                ButtonCard(
                  onPress: () {
                    NavigatorService.to.pushNamedAndRemoveUntil(
                        HomePage.routeName,
                        arguments: AppPageType.ADD_PROJECT,
                    );
                  },
                  height: 35.w,
                  width: 146.w,
                  text: LocaleKeys.add_project.tr(),
                  color: AppColorUtils.PERCENT_COLOR,
                  textColor: AppColorUtils.WHITE,
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
