import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/kraufanding_item_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class KraufandingListWidget extends StatelessWidget {
  final List<KraufandingModel> list;

  const KraufandingListWidget({
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
          ).paddingOnly(top: 20),
        ],
      );
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => KraufandingItemWidget(
        model: list[index],
        onTap: () {
          var model = CardModel(
            "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
            "Texnalogiya",
            "Drenajni kuzatish uchun mo'ljallangan",
            0.6,
            true,
            CardModel.info,
          );
          NavigatorService.to.pushNamed(
            ProjectDetailsPage.routeName,
            arguments: model,
          );
        },
      ),
      itemCount: list.length,
    );
  }
}