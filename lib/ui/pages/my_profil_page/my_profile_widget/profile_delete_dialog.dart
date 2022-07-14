import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/profile_success_done.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class ProfileDeleteDialog extends StatelessWidget {
  ProfileDeleteDialog({required this.myProfileUpdateBloc});
  MyProfileUpdateBloc myProfileUpdateBloc;
  TextEditingController title= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 370.w,
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
                  text: LocaleKeys.delete_profile,
                  color: AppColorUtils.DARK2,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(bottom: 15.w),
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
                      myProfileUpdateBloc.deletePost(title.text);
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ProfileSuccessDone();
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
        )
      ),
    );
  }
}
