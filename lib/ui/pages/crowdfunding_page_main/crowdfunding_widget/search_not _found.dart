

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 220.w,
            ),
            SvgPicture.asset(AppImageUtils.EMPTY_QUESTIONS),
            SizedBox(
              width: 200.sp,
              child: AppWidgets.textLocale(
                textAlign: TextAlign.center,
                text: LocaleKeys.no_results_found,
                color: AppColorUtils.DARK6,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}