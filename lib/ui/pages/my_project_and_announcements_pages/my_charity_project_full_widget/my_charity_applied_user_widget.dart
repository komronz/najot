import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_color_utils.dart';

class MyCharityAppliedUserWidget extends StatelessWidget {
  final CharityModel model;

  const MyCharityAppliedUserWidget({required this.model,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          text: LocaleKeys.the_man_applied,
          color: AppColorUtils.DARK_6,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        AppWidgets.circleImages(

          count: 100,
        ).paddingOnly(top: 3)
      ],
    );
  }
}
