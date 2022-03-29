import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/text_field_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class SupportProjectDialog extends StatelessWidget {
  const SupportProjectDialog({
    Key? key,
  }) : super(key: key);

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
          height: 340.w,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColorUtils.WHITE,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: AppColorUtils.DARK2,
                textAlign: TextAlign.center,
                text: "Loyihani qo'llash",
              ),
              AppWidgets.textLocale(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColorUtils.DARK_6,
                textAlign: TextAlign.center,
                text: "Summani kiriting",
              ).paddingSymmetric(vertical: 10.w),
              TextFieldWidget(
                hintText: "500 000 so'm",
                onChanged: (v) {},
                title: "title",
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                          color: AppColorUtils.RED),
                    ),
                    TextSpan(
                      text:
                      "Summa muallifga borib tushishini ",
                      style: TextStyle(
                        color: AppColorUtils.DARK3,),
                    ),
                    TextSpan(
                      text: "Najot.uz ",
                      style: TextStyle(
                        color: AppColorUtils.BORDER_COLOR,),
                    ),
                    TextSpan(
                      text: "platformasi ta'minlaydi.",
                      style: TextStyle(
                        color: AppColorUtils.DARK3,),
                    )
                  ])).paddingSymmetric(vertical: 12.w),
              ButtonCard(
                onPress: () {},
                text: "To'lov tizimiga o'tish",
                textSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 50,
                width: 296.w,
                color: AppColorUtils.PERCENT_COLOR,
                textColor: AppColorUtils.WHITE,
                borderRadius: 10,
              ),
              SizedBox(height: 12.w,),
              ButtonCard(
                onPress: () {},
                text: "Chiqish",
                textSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 50,
                width: 296.w,
                color: AppColorUtils.GREEN_ACCENT5,
                textColor: AppColorUtils.BLACK,
                borderRadius: 10,
              )
            ],
          ),
        ));
  }
}