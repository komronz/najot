import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/localization/locale_keys.g.dart';

class NotificationDeleteWidget extends StatelessWidget {
  const NotificationDeleteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImageUtils.DELETED_ICON).paddingOnly(bottom: 24.w),
            AppWidgets.textLocale(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColorUtils.DARK2,
                text: "Eslatmani //o'chirib// yubormoqchimisiz",
                richText: true,
                textAlign: TextAlign.center,
                othersMarkers: [
                  MarkerText(marker: "//", style: TextStyle(
                      color: AppColorUtils.RED
                  ),),
                ],
                maxLines: 2
            ).paddingOnly(bottom: 24.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return MyCharitySuccessSendQuestion();
                    //   },
                    // );
                  },
                  text: "Ortga qaytish",
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: 156.w,
                  color: AppColorUtils.SMS_BTN2,
                  textColor: AppColorUtils.KRAUDFANDING,
                  borderRadius: 10,
                ),
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: "Ha",
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: 106.w,
                  color: Color(0xFFFFF5F5),
                  textColor: AppColorUtils.RED,
                  borderRadius: 10,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
