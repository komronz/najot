import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'my_crowdfunding_card_widget.dart';

class MyCrowdfundingListWidget extends StatelessWidget {
  final RootProjectModel ? list;

  const MyCrowdfundingListWidget({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? check_result = list?.results?.isEmpty;
    if (check_result ?? true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.BOX,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.cover,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: LocaleKeys.nothing_found_yet,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
            textAlign: TextAlign.center,
            maxLines: 2,
          ).paddingOnly(
            top: 20.w,
            right: 80.w,
            left: 80.w,
          ),
        ],
      );
    }else{
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
                list!.results!.length,
                    (index) => MyCrowdfundingList(
                  cardModel: list!.results![index],
                  visible: true,
                  onTap: () {},
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
}
