import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/model/volunteering_model.dart';

class MyVolunteeringCommentsWidget extends StatefulWidget {
  const MyVolunteeringCommentsWidget({Key? key, required this.cardModel})
      : super(key: key);

  final VolunteeringModel cardModel;

  @override
  State<MyVolunteeringCommentsWidget> createState() =>
      _MyVolunteeringCommentsWidgetState();
}

class _MyVolunteeringCommentsWidgetState
    extends State<MyVolunteeringCommentsWidget> {
  bool hasTextTitle = false;
  bool hasTextComment = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 12.w,
            left: 12.w,
            right: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.greenAccent4,
          ),
          child: Column(
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: AppWidgets.text(
                          text: LocaleKeys.great_project.tr(),
                          color: AppColorUtils.textGreen2,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      AppWidgets.textLocale(
                        text: "Eshonov Fakhriyor",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.dark6,
                      ).paddingOnly(top: 5.w),
                    ],
                  ).paddingOnly(left: 10),
                ],
              ),
              AppWidgets.text(
                text: widget.cardModel.infoModel![0].text!,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColorUtils.textGrey2,
                maxLines: 100,
                height: 1.5,
              ).paddingSymmetric(vertical: 15.w),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColorUtils.black12,
        ),
        AppWidgets.textLocale(
          text: LocaleKeys.writing_comment.tr(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.textGreen2,
        ).paddingSymmetric(vertical: 8.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 270.w,
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
                hintText: LocaleKeys.comment_title.tr(),
              ),
            ),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasTextTitle == false || hasTextComment == false
                      ? AppColorUtils.disableBc
                      : AppColorUtils.percentColor,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: SizedBox(
                    height: 46.w,
                    width: 46.w,
                    child: const Icon(
                      Icons.arrow_upward,
                      color: AppColorUtils.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        AppTextField(
          hintText: LocaleKeys.write_your_comment.tr(),
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
