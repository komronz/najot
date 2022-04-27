import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';

Widget singleTabDetailCharity(bool type, String text) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: type
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColorUtils.TEXT_GREEN,
                  width: 1.5,
                ),
              ),
            )
          : null,
      margin: const EdgeInsets.only(right: 23.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: type ? AppColorUtils.TEXT_GREEN : AppColorUtils.DARK_6,
          fontWeight: type ? FontWeight.w600 : FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget listDetailCharity(String title, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 18.h),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            color: AppColorUtils.DARK2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 6.h),
      Container(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14.sp,
              color: AppColorUtils.DARK3,
              fontWeight: FontWeight.w400,
              height: 1.5),
        ),
      ),
    ],
  );
}
