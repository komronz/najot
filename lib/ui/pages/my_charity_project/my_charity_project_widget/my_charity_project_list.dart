import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/charity_list_item_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../charity_history_page/widgets/charity_list_widget.dart';
import 'charity_cash_widget.dart';
import '../my_charity_project_type_of_page.dart';

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
            path: AppImageUtils.IMG_CHARITY_EMPTY,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: "Hozircha hech narsa topilmadi",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 20, right: 50,left: 50),
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
                (index) => MyCharityProjectTypeOfPage(
                  charityModel: list[index],
            ),
          ),
        ),

        ],
      ).paddingOnly(left: 20,top: 10,right: 10,),
    );

  }
}

