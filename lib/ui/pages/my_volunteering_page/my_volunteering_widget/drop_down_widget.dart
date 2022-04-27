import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({required this.items, Key? key}) : super(key: key);
  List<String> items;
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColorUtils.GRAY_4,
                ),
              ),
            ),
          ],
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColorUtils.GRAY_4,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColorUtils.WHITE,
        ),
        buttonHeight: 50.h,
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: 14,
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
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
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
    );

  }
}
