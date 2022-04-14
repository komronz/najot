import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/model/charity_model.dart';
import '../../../widgets/app_text_field.dart';

class MyVolunteeringQuestionsAskedWidget extends StatelessWidget {
  const MyVolunteeringQuestionsAskedWidget({
    required this.cardModel,
    Key? key,
  }) : super(key: key);

  final VolunteeringModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(
            top: 12.w,
            left: 12.w,
            right: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.GREEN_ACCENT4,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          true
              ?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    cardModel.imgUrl!,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: AppWidgets.text(
                                    text: "Insoniyat aynan qanday foyda beradi",
                                    color: AppColorUtils.TEXT_GREEN2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    maxLines: 2,
                                ),
                                width: 220.w,
                              ),
                              AppWidgets.textLocale(
                                text: "Eshonov Fakhriyor",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.DARK_6,
                              ).paddingOnly(top: 5.w),
                            ],
                          ).paddingOnly(left: 10),
                        ],
                      ),
                      AppWidgets.text(
                        text: cardModel.infoModel![0].text!,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColorUtils.TEXT_GREY2,
                        maxLines: 100,
                        height: 1.5,
                      ).paddingSymmetric(vertical: 15.w),
                      Divider(
                        thickness: 1,
                        color: AppColorUtils.BLACK_12,
                      ),
                      // AppWidgets.textLocale(
                      //   text: LocaleKeys.author_answer,
                      //   fontSize: 14.sp,
                      //   fontWeight: FontWeight.w600,
                      //   color: AppColorUtils.TEXT_GREEN2,
                      // ).paddingSymmetric(vertical: 8.w),
                      // AppWidgets.text(
                      //   text: cardModel.infoModel![0].text!,
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 14.sp,
                      //   color: AppColorUtils.TEXT_GREY2,
                      //   maxLines: 100,
                      //   height: 1.5,
                      // )
                    ],
                )
              : Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 30.w,),
                        SvgPicture.asset(AppImageUtils.EMPTY_QUESTIONS),
                        SizedBox(
                          width: 200.sp,
                          child: AppWidgets.textLocale(
                            textAlign: TextAlign.center,
                            text: LocaleKeys.questions_empty,
                            color: AppColorUtils.DARK_4,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          Column(
            children: [
              AppWidgets.textLocale(
                text: "Javob yozish",
                fontSize: 18.sp,
                color: AppColorUtils.TEXT_GREEN2,
                fontWeight: FontWeight.w600,
              ),
            ],
          ).paddingOnly(
            left: 12.w,
            bottom: 12.h,
            top: 12.h,
          ),
          AppTextField(
            hintText: "Javobingizni yozing",
            onChanged: (v) {},
            title: "",
            hasTitle: false,
            height: 170.w,
            isMultiLine: true,
          ).paddingOnly(
            top: 12.w,
            bottom: 18.h,
          ),
          AppWidgets.appButton(
            title: LocaleKeys.send,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
