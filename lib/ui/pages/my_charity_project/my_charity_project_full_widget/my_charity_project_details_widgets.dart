import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget singleTabDetailCharity(bool type, String text) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: type
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF048D6A), width: 1.5),
              ),
            )
          : null,
      margin: const EdgeInsets.only(right: 23.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14.sp,
            color: type ? Color(0xFF048D6A) : Color(0xFF939598),
            fontWeight: type ? FontWeight.w600 : FontWeight.w600),
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
            color: Color(0xFF414042),
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
            color: Color(0xFF58595B),
            fontWeight: FontWeight.w400,
            height: 1.5
          ),
        ),
      ),
    ],
  );
}
