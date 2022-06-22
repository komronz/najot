import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'my_charity_project_type_of_page.dart';

class MyCharityProjectList extends StatelessWidget {
  final List<CharityModel> list;

  const MyCharityProjectList({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.imgCharityEmpty,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: LocaleKeys.nothing_found_yet,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: AppColorUtils.gray4,
          ).paddingOnly(
            top: 20.w,
            right: 80.w,
            left: 80.w,
          ),
        ],
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: const ClampingScrollPhysics(),
            childAspectRatio: 168 / 298,
            padding: const EdgeInsets.all(0),
            reverse: false,
            children: List.generate(
              list.length,
              (index) => MyCharityProjectTypeOfPage(
                charityModel: list[index],
              ),
            ),
          ),
        ],
      ).paddingOnly(
        left: 20,
        top: 10,
        right: 10,
      ),
    );
  }
}
