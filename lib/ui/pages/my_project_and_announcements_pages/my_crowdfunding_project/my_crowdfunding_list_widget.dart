import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'my_crowdfunding_card_widget.dart';

class MyCrowdfundingListWidget extends StatelessWidget {
  final List<KraufandingModel> list;

  const MyCrowdfundingListWidget({
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
            path: AppImageUtils.IMG_DOLLAR,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: "Hozircha hech narsa topilmadi",
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
                  (index) => MyCrowdfundingList(
                    cardModel: list[index], visible: true,
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
