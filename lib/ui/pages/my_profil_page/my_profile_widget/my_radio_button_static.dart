import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';

class MyRadioButtonStatic extends StatelessWidget {
  final String initial;

  const MyRadioButtonStatic({
    this.initial = "",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selection = initial == Gender.MAN.toString() ? 1 : 2;
    return Theme(
      data: Theme.of(context).copyWith(
        disabledColor: AppColorUtils.BORDER,
        unselectedWidgetColor: AppColorUtils.BORDER,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.text(
            text: LocaleKeys.gender.tr(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.DARK_4,
          ).paddingOnly(bottom: 10),
          Row(
                  children: [
                    Container(
                      height: 48.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.REG_BACK,
                        border: Border.all(
                          color: AppColorUtils.BORDER,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor: AppColorUtils.BORDER,
                              value: 1,
                              groupValue: _selection,
                              onChanged: (v) {},
                            ),
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.man,
                            color: AppColorUtils.BORDER,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ).paddingOnly(right: 18.w),
                    ),
                    Container(
                      height: 48.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.REG_BACK,
                        border: Border.all(
                          color: AppColorUtils.BORDER,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor: AppColorUtils.BORDER,
                              value: 2,
                              groupValue: _selection,
                              onChanged: (v) {},
                            ),
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.woman,
                            color: AppColorUtils.BORDER,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ).paddingOnly(right: 18.w),
                    ).paddingOnly(left: 20),
                  ],
                ),

        ],
      ),
    );
  }
}
