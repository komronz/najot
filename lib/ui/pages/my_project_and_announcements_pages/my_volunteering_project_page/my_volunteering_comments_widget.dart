

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/model/charity_model.dart';
import '../../../../data/model/volunteering_model.dart';

class MyVolunteeringCommentsWidget extends StatefulWidget {
   MyVolunteeringCommentsWidget({required this.cardModel}) ;
   final VolunteeringModel cardModel;

  @override
  State<MyVolunteeringCommentsWidget> createState() => _MyVolunteeringCommentsWidgetState();
}

class _MyVolunteeringCommentsWidgetState extends State<MyVolunteeringCommentsWidget> {
  bool hasTextTitle = false;
  bool hasTextComment = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 12.w,
            left: 12.w,
            right: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(12),
            color:
            AppColorUtils.GREEN_ACCENT4,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
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
                            widget.cardModel
                                .imgUrl!,
                          ),
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      SizedBox(
                        child:
                        AppWidgets.text(
                          text: LocaleKeys.great_project.tr(),
                          color: AppColorUtils
                              .TEXT_GREEN2,
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                        width: 220.w,
                      ),
                      AppWidgets.textLocale(
                        text:
                        "Eshonov Fakhriyor",
                        fontSize: 12.sp,
                        fontWeight:
                        FontWeight.w400,
                        color: AppColorUtils
                            .DARK_6,
                      ).paddingOnly(top: 5.w),
                    ],
                  ).paddingOnly(left: 10),
                ],
              ),
              AppWidgets.text(
                text: widget.cardModel
                    .infoModel![0].text!,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color:
                AppColorUtils.TEXT_GREY2,
                maxLines: 100,
                height: 1.5,
              ).paddingSymmetric(
                  vertical: 15.w),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: AppColorUtils.BLACK_12,
        ),
        AppWidgets.textLocale(
          text:
          LocaleKeys.writing_comment.tr(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.TEXT_GREEN2,
        ).paddingSymmetric(vertical: 8.w),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: AppTextField(
                onChanged: (v) {
                  if (v != "") {
                    setState(() {
                      hasTextTitle = true;
                    });
                  } else {
                    setState(() {
                      hasTextTitle = false;
                    });
                  }
                },
                title: '',
                hasTitle: false,
                hintText: LocaleKeys
                    .comment_title
                    .tr(),
              ),
              width: 270.w,
            ),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasTextTitle ==
                      false ||
                      hasTextComment ==
                          false
                      ? AppColorUtils
                      .DISABLE_BC
                      : AppColorUtils
                      .PERCENT_COLOR,
                ),
                child: InkWell(
                  borderRadius:
                  BorderRadius.circular(
                      25),
                  onTap: () {},
                  child: Container(
                    height: 46.w,
                    width: 46.w,
                    child: Icon(
                      Icons.arrow_upward,
                      color:
                      AppColorUtils.WHITE,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        AppTextField(
          hintText: LocaleKeys
              .write_your_comment
              .tr(),
          onChanged: (v) {
            if (v != "") {
              setState(() {
                hasTextComment = true;
              });
            } else {
              setState(() {
                hasTextComment = false;
              });
            }
          },
          title: "",
          hasTitle: false,
          height: 170.w,
          isMultiLine: true,
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}
