import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/kraufanding_item_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/kraudfanding_widget/kraudfanding_mini_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/kraufanding_saved_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class KraufandingSavedListWidget extends StatelessWidget {
  final List<CardModel> list;

  const KraufandingSavedListWidget({
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
            path: AppImageUtils.BIG_HEART,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: "Hozircha hech narsa topilmadi",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 20),
        ],
      );
    }
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 160 / 267,
      padding: EdgeInsets.all(0),
      reverse: false,
      crossAxisSpacing: 8,
      mainAxisSpacing: 6,
      children: List.generate(
        list.length,
        (index) => KraudfandingSavedPage(
          visible: true,
          cardModel: list[index],
        ),
      ),
    );
  }
}
