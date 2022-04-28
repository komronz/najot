import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_color_utils.dart';

class VolunteerPassInfoDialog extends StatelessWidget {
  const VolunteerPassInfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                text: LocaleKeys.instructions_uploading_passport,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              AppWidgets.text(
                text: LocaleKeys.document_must_be_clear.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.5,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text:
                LocaleKeys.both_sides_uploaded.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text:
                LocaleKeys.uploaded_by_owner.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: LocaleKeys.document_must_uzbekistan.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: LocaleKeys.can_upload_id_card.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: LocaleKeys.not_load_driver_license.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
              ).paddingOnly(top: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: "*",
                    color: AppColorUtils.RED,
                  ),
                  Expanded(
                    child: AppWidgets.text(
                      text:
                      LocaleKeys.project_guarantees_document.tr(),
                      maxLines: 10,
                      fontSize: 14.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: AppColorUtils.GRAY_4,
                    ),
                  )
                ],
              ).paddingOnly(top: 18),
              AppWidgets.appButton(
                title: LocaleKeys.exit,
                color: AppColorUtils.GREEN_ACCENT5,
                textColor: AppColorUtils.BLACK,
                onTap: () {
                  Navigator.pop(context);
                },
              ).paddingOnly(top: 20),
            ],
          ),
        ),
      ),
    );
  }
}