import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 173.w ,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColorUtils.BACK_AD,
          border:
          Border.all(width: 1, color: AppColorUtils.DIVIDER)),
      child: Row(
        children: [
          SizedBox(
            width: 180.w,
            height: 173.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.text(
                    text: "Lorem Ipsum is simply dummy "
                        "text of the printing and ?",
                    color: AppColorUtils.GRAY_4,
                    fontSize: 12,
                    maxLines: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.text(
                      text: "Biz sizga albatta",
                      color: Colors.black,
                      fontSize: 14,
                      maxLines: 1,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    AppWidgets.text(
                      text: "Yordam beramiz",
                      color: AppColorUtils.GREEN_TEXT,
                      fontSize: 16,
                      maxLines: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                ButtonCard(
                  width: 126.w,
                  height: 35.w,
                  onPress: () {},
                  text: "E'lon berish",
                  fontWeight: FontWeight.w600,
                  textSize: 12.sp,
                  textColor: AppColorUtils.WHITE,
                  color: AppColorUtils.PERCENT_COLOR,
                )
              ],
            ).paddingAll(7.w),
          ),
          SvgPicture.asset(AppImageUtils.HELPER)
        ],
      ),
    );
  }
}
