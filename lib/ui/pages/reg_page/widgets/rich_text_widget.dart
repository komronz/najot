import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: RichText(
        text: TextSpan(
          text: LocaleKeys.i_am.tr(),
          style: TextStyle(
            color: AppColorUtils.BLACK,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: LocaleKeys.project_conditions.tr(),
              style: TextStyle(
                color: AppColorUtils.GREEN_APP,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: LocaleKeys.agree_with_them.tr(),
            )
          ],
        ),
      ),
    );
  }
}
