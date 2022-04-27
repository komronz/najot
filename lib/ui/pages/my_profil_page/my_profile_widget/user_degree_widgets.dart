import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_image_utils.dart';

class blueCheckWidgets extends StatelessWidget {
  blueCheckWidgets({
    required this.title, Key? key,
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(1),
            height: 14.w,
            width: 14.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColorUtils.WHITE,
              border: Border.all(
                width: 1,
                color: AppColorUtils.TEXT_BLUE,
              ),
            ),
            child: SvgPicture.asset(
              AppImageUtils.CHECK_SMALL,
            ),
          ).paddingOnly(top: 5.w),
          SizedBox(width: 8.w),
          Expanded(
            child: AppWidgets.textLocale(
                fontSize: 14.sp,
                color: AppColorUtils.DARK_4,
                fontWeight: FontWeight.w500,
              text: title,
              maxLines: 2,
              ),
          ),
        ],
      ),
    );
  }
}
class greenCheckWidgets extends StatelessWidget {
  greenCheckWidgets({
    required this.title, Key? key,
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(1),
            height: 14.w,
            width: 14.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColorUtils.WHITE,
              border: Border.all(
                width: 1,
                color: AppColorUtils.GREEN_TEXT_10,
              ),
            ),
            child: SvgPicture.asset(
              AppImageUtils.CHECK_SMALL,
              color: AppColorUtils.GREEN_TEXT_10,
            ),
          ).paddingOnly(top: 5.w),
          SizedBox(width: 8),
          Expanded(
            child: AppWidgets.textLocale(
                fontSize: 14.sp,
                color: AppColorUtils.DARK_4,
                fontWeight: FontWeight.w500,
              text: title,
              maxLines: 2,
              ),
          ),
        ],
      ),
    ).paddingOnly(top: 5.w);
  }
}

