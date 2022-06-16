import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:clipboard/clipboard.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/MixTextWidget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SupportProjectDialog extends StatelessWidget {
  const SupportProjectDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 340.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.textLocale(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColorUtils.DARK2,
              textAlign: TextAlign.center,
              text: LocaleKeys.project_implementation,
            ).paddingOnly(bottom: 20.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.credit_card,
                  color: AppColorUtils.BORDER_COLOR,
                ),
                SizedBox(
                  width: 10,
                ),
                AppWidgets.text(
                    text: "Karta raqami",
                    fontSize: 16.sp,
                    color: AppColorUtils.DARK_6,
                    fontWeight: FontWeight.w400),
              ],
            ),
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColorUtils.GREEN_ACCENT5,
                ),
                child: InkWell(
                  onTap: (){
                    FlutterClipboard.copy("8600 1500 8300 1234");
                    Fluttertoast.showToast(
                        msg: "Saqlandi",  // message
                        toastLength: Toast.LENGTH_SHORT, // length
                        gravity: ToastGravity.BOTTOM,    // location
                                     // duration
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 48.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),

                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImageUtils.UZCARD),
                        SizedBox(width: 10.w,),
                        AppWidgets.text(
                          text: "8600 1500 8300 1234",
                          color: AppColorUtils.KRAUDFANDING,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MixTextWidget().paddingSymmetric(vertical: 12.w),
            ButtonCard(
              onPress: () {},
              text: LocaleKeys.switch_amount.tr(),
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.PERCENT_COLOR,
              textColor: AppColorUtils.WHITE,
              borderRadius: 10,
            ),
            SizedBox(
              height: 12.w,
            ),
            ButtonCard(
              onPress: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.exit.tr(),
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.GREEN_ACCENT5,
              textColor: AppColorUtils.BLACK,
              borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
