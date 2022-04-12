import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
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
              color: Color(0xFFFFFFFF),
              border: Border.all(
                width: 1,
                color: Color(0xFF0344A7),
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
                color: Color(0xFF6D6E71),
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
              color: Color(0xFFFFFFFF),
              border: Border.all(
                width: 1,
                color: Color(0xFF038D69),
              ),
            ),
            child: SvgPicture.asset(
              AppImageUtils.CHECK_SMALL,
              color: Color(0xFF038D69),
            ),
          ).paddingOnly(top: 5.w),
          SizedBox(width: 8),
          Expanded(
            child: AppWidgets.textLocale(
                fontSize: 14.sp,
                color: Color(0xFF6D6E71),
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

