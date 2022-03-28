



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class KraudfandingAppliedUserWidgets extends StatelessWidget {
  final CardModel model;

  const KraudfandingAppliedUserWidgets({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          text: "Odam qo'lladi",
          color: AppColorUtils.DARK_6,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImageUtils.DEF_PERSON),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImageUtils.DEF_PERSON),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            AppWidgets.text(
              text: "+${100}",
              color: AppColorUtils.TEXT_GREEN2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ).paddingOnly(left: 3),
          ],
        ).paddingOnly(top: 3)
      ],
    );
  }
}