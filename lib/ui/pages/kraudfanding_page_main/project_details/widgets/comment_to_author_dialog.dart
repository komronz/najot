import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/bloc/project_data_cubit/project_data_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/success_send_question_dialog.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/config/const/decoration_const.dart';

class CommentToAuthorDialog extends StatelessWidget {
  CommentToAuthorDialog({
    required this.cubit,
    required this.projectModel,
  });

  ProjectDataCubit cubit;
  ProjectModel projectModel;
  TextEditingController titleController = TextEditingController();
  TextEditingController commentController = TextEditingController();

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
                SizedBox(
                  height: 80.w,
                  child: TextField(
                    controller: titleController,
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
                      hintText: LocaleKeys.title_question.tr(),
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColorUtils.GRAY_4,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                  ).paddingOnly(
                    top: 18.w,
                    bottom: 12.w,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: TextFormField(
                    controller: commentController,
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
                      hintText: LocaleKeys.write_question.tr(),
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColorUtils.GRAY_4,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    onChanged: (v) {},
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                ButtonCard(
                  onPress: () async{
                    var internetConnection=await MainService().checkInternetConnection();
                    if(internetConnection){
                      if (titleController.text != "" &&
                          commentController.text != "") {
                        cubit.postQuestion(
                          projectModel.id!,
                          titleController.text,
                          commentController.text,
                        );
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessSendQuestion();
                          },
                        );
                        cubit.load(projectModel.id!);


                      }else{
                        AppWidgets.showText(text: LocaleKeys.write_question.tr());
                      }
                    }else{
                      AppWidgets.showText(text: "Internet bilan aloqa yo'q!");
                    }

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
