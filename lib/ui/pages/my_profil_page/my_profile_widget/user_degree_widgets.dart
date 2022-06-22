import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_image_utils.dart';

class BlueCheckWidgets extends StatelessWidget {
  const BlueCheckWidgets({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          height: 14.w,
          width: 14.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColorUtils.white,
            border: Border.all(
              width: 1,
              color: AppColorUtils.textBlue,
            ),
          ),
          child: SvgPicture.asset(
            AppImageUtils.checkSmall,
          ),
        ).paddingOnly(top: 5.w),
        SizedBox(width: 8.w),
        Expanded(
          child: AppWidgets.textLocale(
            fontSize: 14.sp,
            color: AppColorUtils.dark4,
            fontWeight: FontWeight.w500,
            text: title,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class GreenCheckWidgets extends StatelessWidget {
  const GreenCheckWidgets({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          height: 14.w,
          width: 14.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColorUtils.white,
            border: Border.all(
              width: 1,
              color: AppColorUtils.greenText10,
            ),
          ),
          child: SvgPicture.asset(
            AppImageUtils.checkSmall,
            color: AppColorUtils.greenText10,
          ),
        ).paddingOnly(top: 5.w),
        const SizedBox(width: 8),
        Expanded(
          child: AppWidgets.textLocale(
            fontSize: 14.sp,
            color: AppColorUtils.dark4,
            fontWeight: FontWeight.w500,
            text: title,
            maxLines: 2,
          ),
        ),
      ],
    ).paddingOnly(top: 5.w);
  }
}
