import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import 'my_charity_success_send_question_dialog.dart';

class MyCharityDeleteProjectDialog extends StatelessWidget {
  const MyCharityDeleteProjectDialog({Key? key}) : super(key: key);

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
          color: AppColorUtils.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImageUtils.trash).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: LocaleKeys.delete_the_project,
                      color: AppColorUtils.dark2,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).paddingOnly(bottom: 5),
                AppWidgets.textLocale(
                  text: LocaleKeys.contact_delete_project,
                  maxLines: 2,
                  color: AppColorUtils.dark6,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ).paddingOnly(bottom: 24.h),
                AppWidgets.textLocale(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColorUtils.dark2,
                        text: LocaleKeys.reason_deletion_short,
                        richText: true,
                        othersMarkers: [
                          MarkerText(
                            marker: "//",
                            style: const TextStyle(color: AppColorUtils.red),
                          )
                        ],
                        maxLines: 2)
                    .paddingOnly(bottom: 8.h),
                AppTextField(
                  isMultiLine: true,
                  height: 170.w,
                  hintText: LocaleKeys.write_the_reason.tr(),
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
                        return const MyCharitySuccessSendQuestion();
                      },
                    );
                  },
                  text: LocaleKeys.send,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: double.infinity,
                  color: AppColorUtils.percentColor,
                  textColor: AppColorUtils.white,
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
                  color: AppColorUtils.greenAccent5,
                  textColor: AppColorUtils.black,
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
