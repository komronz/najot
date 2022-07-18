import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class KraudfandingAuthorWidget extends StatelessWidget {
  final ProjectModel model;
  final VoidCallback onTap;

  const KraudfandingAuthorWidget({
    required this.model,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                shape : BoxShape.circle,
                color: Colors.black12,
              ),
              child: CachedNetworkImage(
                imageUrl: model.owner!.photo!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.person),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.project_author,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_6,
                ),
                SizedBox(
                  width: 150.w,
                  child: AppWidgets.text(
                    text: "${model.owner!.firstName!} ${model.owner!.lastName!}",
                    color: AppColorUtils.TEXT_GREEN2,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ).paddingOnly(top: 2.w),
                ),
              ],
            ).paddingOnly(left: 10),
          ],
        ),
        ButtonCard(
          onPress: onTap,
          text: LocaleKeys.ask_question.tr(),
          width: 100.w,
          height: 35.w,
          color: AppColorUtils.GREEN_BTN,
          textColor: AppColorUtils.GREEN_TEXT,
          borderRadius: 10,
          textSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
