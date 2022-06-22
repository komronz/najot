import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/charity_list_item_widget.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class CharityListWidget extends StatelessWidget {
  final List<CharityModel> list;

  const CharityListWidget({
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
            textAlign: TextAlign.center,
            maxLines: 2,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.gray4,
          ).paddingOnly(top: 20, right: 70.w, left: 70.w),
        ],
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CharityListItemWidget(
        model: list[index],
        onTap: () {
          NavigatorService.to.pushNamed(
            CharityFullPage.routName,
            arguments: list[index],
          );
        },
      ),
      itemCount: list.length,
    );
  }
}
