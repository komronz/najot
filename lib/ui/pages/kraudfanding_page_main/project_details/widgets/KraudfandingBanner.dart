

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class KraudfandingBanner extends StatelessWidget {
  const KraudfandingBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 163.w,
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColorUtils.BACK_AD,
        border: Border.all(
          width: 1,
          color: AppColorUtils.DIVIDER,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(AppImageUtils.Splash2),
          ),
          SizedBox(width: 14.w),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.text(
                      text: "G'oya bor ammo mablag' yo'qmi?",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      color: AppColorUtils.TEXT_GREY,
                    ),
                    SizedBox(height: 10.w),
                    AppWidgets.text(
                      text: "Biz sizga yordam beramiz!",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      maxLines: 1,
                      color: AppColorUtils.TEXT_GREY,
                    ),
                    SizedBox(height: 20.w),
                    ButtonCard(
                      onPress: () {},
                      height: 35.w,
                      width: 146.w,
                      text: "Loyiha qo'shish",
                      color: AppColorUtils.PERCENT_COLOR,
                      textColor: AppColorUtils.WHITE,
                      textSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}