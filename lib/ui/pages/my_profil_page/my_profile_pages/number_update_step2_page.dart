import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class NumberUpdateStep2Page extends StatelessWidget {
  static const String routeName = "/numberUpdateStep2Page";

  const NumberUpdateStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140.w,
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFFDFFFF),
              border: Border.all(
                color: Color(0xFF97C2BA),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                AppWidgets.textLocale(
                        text: "1 2 3 4 5 6",
                        textAlign: TextAlign.center,
                        color: Color(0xFF0BA42D),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600)
                    .paddingOnly(right: 10),
                Container(
                  child: SvgPicture.asset(AppImageUtils.CHECK),
                ),
              ],
            ),
          ).paddingOnly(bottom: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF0BBF90),
            ),
            child: AppWidgets.textLocale(
              text: LocaleKeys.confirmation,
              textAlign: TextAlign.center,
              color: Color(0xFFFFFFFF),
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
