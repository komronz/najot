import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/sms_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/date_time_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class OperatorUserSmsWidget extends StatelessWidget {
  final SmsModel model;

  const OperatorUserSmsWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = calculateWidth(model.text!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          width: width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.SMS_USER,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppWidgets.text(
                text: model.text!,
                maxLines: 100,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.WHITE,
                height: 1.5,
              ),
              AppWidgets.text(
                text: DateTimeUtil.dmy(
                  model.dateTime!,
                  context.locale,
                ),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColorUtils.WHITE,
              ).paddingOnly(top: 10),
            ],
          ),
        ),
      ],
    ).paddingOnly(bottom: 18, top: 18, right: 18);
  }
 static double calculateWidth(String s) {
    if (s.length < 12) {
      return 100.0;
    }
    if (s.length > 35) {
      return 264.0;
    }
    return s.length * 8 + 30;
  }
}


