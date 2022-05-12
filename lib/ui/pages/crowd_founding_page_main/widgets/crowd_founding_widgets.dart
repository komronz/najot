import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';

Widget singleTab(bool type, String text) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: type
          ? BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(color: AppColorUtils.KRAUDFANDING, width: 1.5),
              ),
            )
          : null,
      height: 24.h,
      margin: const EdgeInsets.only(right: 24.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: type ? AppColorUtils.KRAUDFANDING : AppColorUtils.DARK_6,
          fontWeight: type ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    ),
  );
}
