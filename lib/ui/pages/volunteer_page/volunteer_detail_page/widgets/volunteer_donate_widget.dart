import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/MixTextWidget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/text_field_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerDonateWidget extends StatelessWidget {
  VolunteerDonateWidget({required this.cardModel});

  ProjectModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            text: LocaleKeys.donate,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.DARK2,
          ).paddingOnly(
            left: 20.w,
            top: 20.w,
            bottom: 3.w,
          ),
          AppWidgets.text(
                  text: "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK2,
                  maxLines: 50,
                  height: 1.4.w)
              .paddingOnly(
            left: 20.w,
            right: 20.w,
            bottom: 12.w,
          ),
          AppWidgets.textLocale(
                  text: LocaleKeys.person_applied,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_6)
              .paddingSymmetric(horizontal: 20.w),
          AppWidgets.circleImages(
            image: cardModel.coverUrl!,
            count: 100,
          ).paddingSymmetric(horizontal: 20.w),
          AppWidgets.textLocale(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: AppColorUtils.DARK_6,
            textAlign: TextAlign.center,
            text: LocaleKeys.enter_amount,
          ).paddingSymmetric(
            vertical: 10.w,
            horizontal: 20.w,
          ),
          TextFieldWidget(
            hintText: "500 000 ${LocaleKeys.som.tr()}",
            onChanged: (v) {},
            title: '',
          ).paddingSymmetric(horizontal: 20.w),
          MixTextWidget().paddingSymmetric(
            vertical: 12.w,
            horizontal: 20.w,
          ),
          ButtonCard(
            onPress: () {},
            text: LocaleKeys.switch_amount,
            textSize: 16.sp,
            fontWeight: FontWeight.w500,
            height: 50.w,
            width: MediaQuery.of(context).size.width,
            color: AppColorUtils.PERCENT_COLOR,
            textColor: AppColorUtils.WHITE,
            borderRadius: 10,
          ).paddingSymmetric(horizontal: 20.w),
        ],
      ),
    );
  }
}
