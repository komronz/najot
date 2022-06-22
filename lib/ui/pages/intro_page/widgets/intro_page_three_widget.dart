import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'intro_view_widgets.dart';

class IntroPageThreeWidget extends StatelessWidget {
  const IntroPageThreeWidget({
    required this.image,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);
  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroClipPathWidget(height: context.height * 0.63.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppWidgets.imageAsset(path: image).paddingOnly(
              bottom: 85.w,
            ),
            AppWidgets.textLocale(
              text: title,
              color: AppColorUtils.greenBlack,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ).paddingOnly(bottom: 8.w),
            AppWidgets.textLocale(
              text: content,
              color: AppColorUtils.greenWhite,
              textAlign: TextAlign.center,
              maxLines: 2,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ).paddingOnly(top: 100.w),
      ],
    );
  }
}
