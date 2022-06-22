import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class MixTextWidget extends StatelessWidget {
  const MixTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppWidgets.textLocale(
          text: LocaleKeys.send_payment1,
          color: AppColorUtils.dark3,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          maxLines: 2,
          richText: true,
          othersMarkers: [
            MarkerText(
              marker: "&",
              style: const TextStyle(
                color: AppColorUtils.red,
              ),
            ),
            MarkerText(
              marker: "//",
              style: const TextStyle(
                color: AppColorUtils.greenText,
              ),
            ),
            MarkerText(
              marker: "#",
              style: const TextStyle(
                  color: AppColorUtils.black, fontWeight: FontWeight.w600),
            )
          ]),
    );
  }
}
