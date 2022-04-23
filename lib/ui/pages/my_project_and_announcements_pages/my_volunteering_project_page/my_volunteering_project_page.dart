import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/volunteering_project_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class MyVolunteeringProjectPage extends StatelessWidget {
  final List<VolunteeringModel> list;

  const MyVolunteeringProjectPage({
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
            path: AppImageUtils.VOLUNTEER_HANDS,
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
            color: AppColorUtils.GRAY_4,
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
            physics: ClampingScrollPhysics(),
            childAspectRatio: 168 / 298,
            padding: EdgeInsets.all(0),
            reverse: false,
            children: List.generate(
              list.length,
                  (index) => VolunteeringProjectWidget(
                model: list[index], onTap: () {

                  },
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
