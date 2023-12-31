import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import 'my_charity_success_send_question_dialog.dart';

class MyEditProjectDialog extends StatelessWidget {
   MyEditProjectDialog({ required this.cubit})  ;

  MyCrowdfundingSupportCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 470.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImageUtils.EDIT_DEMO).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: LocaleKeys.edit_the_project,
                      color: AppColorUtils.DARK2,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).paddingOnly(bottom: 5),
                AppWidgets.textLocale(
                  text: LocaleKeys.contact_changes_project,
                  maxLines: 2,
                  color: AppColorUtils.DARK_6,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ).paddingOnly(bottom: 24.h),
                AppWidgets.textLocale(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColorUtils.DARK2,
                    text: LocaleKeys.what_changes_make,
                ).paddingOnly(bottom: 8.h),
                AppTextField(
                  isMultiLine: true,
                  height: 170.w,
                  hintText: LocaleKeys.write.tr(),
                  onChanged: (v) {},
                  title: "",
                  hasTitle: false,
                ),
                SizedBox(
                  height: 12.w,
                ),
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return MyCharitySuccessSendQuestion();
                      },
                    );
                  },
                  text: LocaleKeys.send,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: double.infinity,
                  color: AppColorUtils.PERCENT_COLOR,
                  textColor: AppColorUtils.WHITE,
                  borderRadius: 10,
                ),
                SizedBox(
                  height: 12.w,
                ),
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: LocaleKeys.exit,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: double.infinity,
                  color: AppColorUtils.GREEN_ACCENT5,
                  textColor: AppColorUtils.BLACK,
                  borderRadius: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
