import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import '../../../../data/config/const/decoration_const.dart';
import 'my_charity_success_send_question_dialog.dart';

class MyDeleteProjectDialog extends StatelessWidget {
   MyDeleteProjectDialog({required this.cubit,required this.projectModel,}) ;

   MyCrowdfundingSupportCubit cubit;
   ProjectModel projectModel;
  TextEditingController title= TextEditingController();
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
                    SvgPicture.asset(AppImageUtils.TRASH).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: LocaleKeys.delete_the_project,
                      color: AppColorUtils.DARK2,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).paddingOnly(bottom: 5),
                AppWidgets.textLocale(
                  text: LocaleKeys.contact_delete_project,
                  maxLines: 2,
                  color: AppColorUtils.DARK_6,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ).paddingOnly(bottom: 24.h),
                AppWidgets.textLocale(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColorUtils.DARK2,
                    text: LocaleKeys.reason_deletion_short,
                    richText: true,
                    othersMarkers: [
                      MarkerText(marker: "//", style: TextStyle(
                          color: AppColorUtils.RED
                      ),)
                    ],
                    maxLines: 2
                ).paddingOnly(bottom: 8.h),
                SizedBox(

                  height: 170.w,
                  child: TextField(
                    controller: title,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    enabled: true,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                    ),
                    decoration: InputDecoration(
                      // border: _border,
                      disabledBorder: DecorationConst.INPUT_BORDER,
                      focusedBorder: DecorationConst.INPUT_BORDER,
                      enabledBorder: DecorationConst.INPUT_BORDER,
                      contentPadding: EdgeInsets.all(14),
                      hintText: LocaleKeys.write_the_reason.tr(),
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColorUtils.GRAY_4,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                ButtonCard(
                  onPress: () {
                    if(title.text.isNotEmpty){
                      cubit.deletePost(projectModel.id!, title.text);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return MyCharitySuccessSendQuestion();
                        },
                      );
                    }else{
                      AppWidgets.showText(text: "Sababni yozing");
                    }

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
