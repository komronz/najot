import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/language_page/pinput_number_change.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../main_page/widgets/button_card_widget.dart';

class NumberUpdating extends StatelessWidget {
  NumberUpdating(
      {required this.state,
      required this.number,
      required this.confirmation,
      required this.resend});

  MyProfileUpdateState state;
  String number;
  Function confirmation;
  VoidCallback resend;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColorUtils.WHITE,
              border: Border.all(
                color: AppColorUtils.GREEN_6,
                width: 2,
              ),
            ),
            child: Container(
              width: 150.w,
              child: Row(
                children: [
                  PinPutNumberChangeWidget(
                    pinPutFocusNode: _pinPutFocusNode,
                    pinPutController: _pinPutController,
                  ).paddingOnly(right: 10),
                  SvgPicture.asset(AppImageUtils.CHECK),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.w),
          ButtonCard(
            textSize: 16.sp,
            fontWeight: FontWeight.w600,
            textColor: AppColorUtils.WHITE,
            borderRadius: 12,
            height: 48.w,
            width: 1.sw,
            color: AppColorUtils.PERCENT_COLOR,
            onPress: () {
              confirmation(_pinPutController.text);
            },
            text: LocaleKeys.confirmation.tr(),
          ).paddingOnly(bottom: 18.w),
          ButtonCard(
            textSize: 16.sp,
            fontWeight: FontWeight.w500,
            textColor: AppColorUtils.BlUE_2,
            borderRadius: 12,
            height: 48.w,
            width: 1.sw,
            color: AppColorUtils.WHITE,
            onPress: resend,
            text: LocaleKeys.send_again.tr(),
          ).paddingSymmetric(horizontal: 70.w),
        ],
      ),
    );
  }
}
