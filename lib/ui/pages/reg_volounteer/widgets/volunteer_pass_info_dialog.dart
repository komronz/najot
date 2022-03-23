import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_color_utils.dart';

class VolunteerPassInfoDialog extends StatelessWidget {
  const VolunteerPassInfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                text: "Passport rasmini yuklash bo’yicha ko’rsatmalar",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              AppWidgets.text(
                text: "1.Xujjat rasmi tiniq sifatda bo’lishi shart",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.5,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text:
                "2. Xujjatni ikki tomoni yuklanishi kerak (ma’lumotlar sahifasi va ro’yxatga olingan mazil sahifasi) ",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text:
                "3. Xujjatni rasmini o’z egasi yuklashi shart (moderatorlar tomonidan tekshiriladi)",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: "4. Xujjat O’zbekiston Respublikasini bo’lishi kerak.",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
                height: 1.3,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: "5. ID- Kartani ham yuklashingiz mumkin",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
              ).paddingOnly(top: 18),
              AppWidgets.text(
                text: "6. Haydovchikil guvohnomasini yuklash mumkin emas",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                maxLines: 10,
              ).paddingOnly(top: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: "*",
                    color: AppColorUtils.RED,
                  ),
                  Expanded(
                    child: AppWidgets.text(
                      text:
                      "Najot.uz lohiyasi, xujjatingiz ommaga tarqalmasligiga kafolat beriadi!",
                      maxLines: 10,
                      fontSize: 14.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: AppColorUtils.GRAY_4,
                    ),
                  )
                ],
              ).paddingOnly(top: 18),
              AppWidgets.appButton(
                title: "Chiqish",
                color: Color(0xffEBF8F4),
                textColor: Colors.black,
                onTap: () {
                  Navigator.pop(context);
                },
              ).paddingOnly(top: 20),
            ],
          ),
        ),
      ),
    );
  }
}