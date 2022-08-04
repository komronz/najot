import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({
    required this.items,
    required this.title,
    required this.hasTitle,
    required this.onChange,
    this.isEmpty = false,
    this.selectValue,
    Key? key,
    required this.height,
  }) : super(key: key);
  final List<String>? items;
  final bool isEmpty;
  final double height;
  final bool hasTitle;
  final String title;
  final String? selectValue;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hasTitle
            ? Row(
                children: [
                  isEmpty
                      ? SizedBox()
                      : AppWidgets.textLocale(
                          text: "*",
                          color: AppColorUtils.RED,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  AppWidgets.textLocale(
                    text: title,
                    color: AppColorUtils.DARK_4,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ).paddingOnly(top: 4),
                ],
              ).paddingOnly(bottom: 8)
            : SizedBox(),
        Container(
          height: height,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 35,
                    color: AppColorUtils.GREEN_TEXT,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      LocaleKeys.select.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.GRAY_4,
                      ),
                    ),
                  ),
                ],
              ),
              items: items!
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColorUtils.DARK2,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectValue,
              onChanged: (v) => onChange(v),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColorUtils.WHITE,
              ),
              buttonHeight: 50.h,
              buttonPadding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: 2,
                  color: AppColorUtils.BORDER_COLOR,
                ),
                color: AppColorUtils.WHITE,
              ),
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(
                left: 14,
                right: 14,
              ),
              dropdownMaxHeight: 200.h,
              dropdownWidth: 250.w,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColorUtils.WHITE,
              ),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: false,
              offset: const Offset(0, 0),
            ),
          ),
        ),
      ],
    );
  }
}
