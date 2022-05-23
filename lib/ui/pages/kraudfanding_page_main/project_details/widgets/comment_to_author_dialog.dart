    import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/success_send_question_dialog.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class CommentToAuthorDialog extends StatelessWidget {
  const CommentToAuthorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 450.w,
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
                AppWidgets.textLocale(
                  text: LocaleKeys.author_write_question,
                  color: AppColorUtils.DARK2,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppTextField(
                  hintText: LocaleKeys.title_question.tr(),
                  onChanged: (v) {},
                  title: "",
                  hasTitle: false,
                ).paddingOnly(
                  top: 18.w,
                  bottom: 12.w,
                ),
                AppTextField(
                  isMultiLine: true,
                  height: 170.w,
                  hintText: LocaleKeys.write_question.tr(),
                  onChanged: (v) {},
                  title: "",
                  hasTitle: false,
                ),
                SizedBox(height: 12.w,),
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessSendQuestion();
                      },
                    );

                  },
                  text: LocaleKeys.send.tr(),
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 50.w,
                  width: 296.w,
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
                  text: LocaleKeys.exit.tr(),
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 50.w,
                  width: 296.w,
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
