import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/app_widgets.dart';

Widget toggle({required String title,required bool isSelect}){
  return Container(
    height: 48.h,
    width: 114.w,
    decoration: isSelect? BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFFFFFF),
        border: Border.all(
          width: 1,
          color: Color(0xFF048D6A),
        )):BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFFFFFF),
        border: Border.all(
          width: 1,
          color: Color(0xFF939598),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(2.0),
          height: 24.h,
          width: 24.w,
          decoration:isSelect?BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFFFFFFF),
            border: Border.all(
              width: 1,
              color: Color(0xFF048D6A),
            ),
          ):BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFFFFFFF),
              border: Border.all(
                width: 1,
                color: Color(0xFF939598),
              )),
          child: Container(
            height: 18.h,
            width: 18.w,
            decoration: isSelect?BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFF048D6A),
            ):BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFFFFFFF),

            ),
          ),
        ),
        AppWidgets.textLocale(
            text: title,
            fontSize: 15.sp,
            color: isSelect?Color(0xFF048D6A):Color(0xFF414042),
            fontWeight: FontWeight.w500)
      ],
    ),
  );
}
