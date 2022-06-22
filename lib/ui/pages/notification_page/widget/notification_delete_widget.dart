import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

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
          color: AppColorUtils.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImageUtils.deletedIcon)
                .paddingOnly(bottom: 24.w),
            AppWidgets.textLocale(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColorUtils.dark2,
                    text: LocaleKeys.want_delete_note,
                    richText: true,
                    textAlign: TextAlign.center,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(color: AppColorUtils.red),
                      ),
                    ],
                    maxLines: 2)
                .paddingOnly(bottom: 24.w),
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
                  text: LocaleKeys.go_back,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: 156.w,
                  color: AppColorUtils.smsBtn2,
                  textColor: AppColorUtils.kraudfanding,
                  borderRadius: 10,
                ),
                ButtonCard(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: LocaleKeys.yes,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 48.w,
                  width: 106.w,
                  color: AppColorUtils.deleteBtn,
                  textColor: AppColorUtils.red,
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
