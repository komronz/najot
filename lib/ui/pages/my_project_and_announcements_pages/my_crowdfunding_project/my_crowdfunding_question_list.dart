import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/crowd_founding_model.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/app_widgets.dart';

class MyCrowdfundingQuestionList extends StatefulWidget {
  MyCrowdfundingQuestionList({required this.cardModel, Key? key})
      : super(key: key);
  final CrowdFoundingModel cardModel;

  @override
  _MyCrowdfundingQuestionListState createState() =>
      _MyCrowdfundingQuestionListState();
}

bool isVisible = true;

class _MyCrowdfundingQuestionListState
    extends State<MyCrowdfundingQuestionList> {
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
        border: Border.all(
          width: 1.w,
          color: AppColorUtils.GRAY_3,
        ),
        color: AppColorUtils.GREEN_ACCENT4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          true
              ? Column(
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
                                  widget.cardModel.imgUrl!,
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
                              ).paddingOnly(top: 5.w),
                              width: 240.w,
                            ),
                            AppWidgets.textLocale(
                              text: "Eshonov Fakhriyor",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColorUtils.DARK_6,
                            ).paddingOnly(top: 3.w),
                          ],
                        ).paddingOnly(left: 10),
                      ],
                    ),
                    AppWidgets.text(
                      text: widget.cardModel.infoModel![0].text!,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColorUtils.TEXT_8,
                      maxLines: 100,
                      height: 1.5,
                    ).paddingSymmetric(vertical: 10.w),
                    Visibility(
                        visible: !isVisible,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1,
                                color: AppColorUtils.BLACK_12,
                              ),
                              AppWidgets.textLocale(
                                text: "Sizning javobingiz",
                                fontSize: 14.sp,
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                              ).paddingOnly(
                                bottom: 3.w,
                                top: 7.w,
                              ),
                              AppTextField(
                                hintText: "Javobingizni yozing",
                                onChanged: (v) {},
                                title: "",
                                hasTitle: false,
                                height: 228.w,
                                isMultiLine: true,
                              ).paddingOnly(
                                top: 12.w,
                                bottom: 18.h,
                              ),
                              AppWidgets.appButton(
                                title: LocaleKeys.send,
                                height: 38.w,
                                width: 152.w,
                                onTap: () {
                                  setState(() {
                                    isVisible = true;
                                  });
                                },
                              ).paddingOnly(bottom: 12.w),
                            ],
                          ),
                        )),
                    Visibility(
                      visible: isVisible,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFDFF8F3),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColorUtils.BORDER_COLOR,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = false;
                            });
                          },
                          child: AppWidgets.textLocale(
                            text: "Javob yozish",
                            color: Color(0xFF024739),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ).paddingOnly(
                            left: 10.w,
                            top: 7.w,
                            bottom: 10.w,
                            right: 15.w,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 18.w),
                    ),
                  ],
                )
              : Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.w,
                        ),
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
        ],
      ),
    ).paddingOnly(bottom: 18.w);
  }
}
