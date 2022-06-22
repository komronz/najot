import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/mix_text_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/text_field_widget.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerDonateWidget extends StatelessWidget {
  const VolunteerDonateWidget({Key? key, required this.cardModel})
      : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.textLocale(
          text: LocaleKeys.donate,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.dark2,
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
                color: AppColorUtils.dark2,
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
                color: AppColorUtils.dark6)
            .paddingSymmetric(horizontal: 20.w),
        AppWidgets.circleImages(
          image: cardModel.image!,
          count: 100,
        ).paddingSymmetric(horizontal: 20.w),
        AppWidgets.textLocale(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: AppColorUtils.dark6,
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
        const MixTextWidget().paddingSymmetric(
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
          color: AppColorUtils.percentColor,
          textColor: AppColorUtils.white,
          borderRadius: 10,
        ).paddingSymmetric(horizontal: 20.w),
      ],
    );
  }
}
