

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SuccessSendQuestion extends StatelessWidget {
  const SuccessSendQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
      EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 300.w,
        padding: EdgeInsets.all(25.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,

          children: [
            SvgPicture.asset(AppImageUtils.SUCCESS),
            AppWidgets.textLocale(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: AppColorUtils.DARK2,
              textAlign: TextAlign.center,
              text: "Savolingiz muvafaqiyatli yuborildi",
              maxLines: 2
            ),
            AppWidgets.textLocale(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColorUtils.DARK_6,
              textAlign: TextAlign.center,
              text: "Iltimos muallif javobini kuting!",
            ).paddingSymmetric(vertical: 10.w),
            // TextFieldWidget(
            //   hintText: "500 000 so'm",
            //   onChanged: (v) {},
            //
            // ),

            SizedBox(height: 12.w,),
            ButtonCard(
              onPress: () {
                Navigator.pop(context);
              },
              text: "Xo'p, rahmat",
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 50.w,
              width: 296.w,
              color: AppColorUtils.GREEN_ACCENT5,
              textColor: AppColorUtils.SMS_BTN3,
              borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}