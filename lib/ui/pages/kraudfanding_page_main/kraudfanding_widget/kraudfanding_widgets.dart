import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget singleTab(bool type, String text){
  return Container(
    decoration: type? BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xFF048D6A),width: 1.5),
      ),
    ):null,
    height: 24.h,
    margin: const EdgeInsets.only(right: 24.0),
    child: Text(text,style: TextStyle(fontSize: 14, color: type?Color(0xFF048D6A):Color(0xFF939598),
        fontWeight: type?FontWeight.w600:FontWeight.w400),
    ),
  );
}
