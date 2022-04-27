import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/widgets/volunteering_charity_full_page.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/widgets/volunteering_charity_list_item_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteeringCharityListWidget extends StatelessWidget {
  final List<CharityModel> list;

  const VolunteeringCharityListWidget({
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
            text: LocaleKeys.nothing_found_yet,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
            textAlign: TextAlign.center,
            maxLines: 2,
          ).paddingOnly(top: 20, left: 50.w, right: 50.w,),
        ],
      );
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => VolunteeringCharityListItemWidget(
        model: list[index],
        onTap: () {
          var model = CharityModel(
              title: "Onaxonni yoshlari katta, ularga ovqat qilib berish kerak",
              percent: 75.0,
              imgUrl: "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
              author: "Fayzullayev Olim",
              totalSum: "1 000 000",
              currentSum: "1 000 000",
              applied: 50,
              createdDate: "25.08.2022",
              isFavorite: false,
              collectedDate: "28.08.2022",
              typeOfHelp: "Oyoq kiyimi",
              volunteerName: "Abdulloh",
              typeOfCharity: "item",
              infoModel: CharityModel.info,
          );
          NavigatorService.to.pushNamed(
            VolunteeringCharityFullPage.routName,
            arguments: model,
          );
        },
      ),
      itemCount: list.length,
    );
  }
}
