import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/utils/app_color_utils.dart';

Widget projectHeader(BuildContext context){
  return Stack(
    children:[
      Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 18, right: 20, left: 20, bottom: 18),
          padding: EdgeInsets.all(4.0),
          height: 46,
          width: 335,
          decoration: BoxDecoration(
              color: Color(0xFFF8FFFE),
              borderRadius: BorderRadius.circular(30.0),
              border:
              Border.all(width: 1.0, color: Color(0xFFB7E4DB))),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFF0BBF90),
                    ),
                    child: Text(
                      "Loyiha haqida",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Expanded(
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(left: 44),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "Mahsulotlar",
                      style: TextStyle(
                          color: Color(0xFF71958E),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ),
        ),
        Container(
          height: 308.h,
          width: 335.w,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 18),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: Image.asset(
              "assets/images/rasm.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 18),
          height: 52.h,
          child: Text(
            "Drenajni kuzatish uchun mo’jallangan moslama",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xFF414042)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          height: 50,
          child: Row(
            children: [
              Container(
                  height: 50.h,
                  width: 50.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: Image.asset(
                      "assets/images/rasm.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    height: 17,
                    child: Text(
                      'Loyiha muallifi',
                      style: TextStyle(
                          color: Color(0xFF939598), fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    height: 20,
                    child: Text(
                      'Eshonov Fakhriyor',
                      style: TextStyle(
                          color: Color(0xFF043F3B),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8, bottom: 8, left: 12, right: 12),
                    height: 33.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFEAF9F6),
                    ),
                    child: Text("Savol berish",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF055641),
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "*",
                            style: TextStyle(
                                color: Colors.red, fontSize: 10)),
                        TextSpan(
                          text: " Lozim bo’lgan summa",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF939598)),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: Text(
                      "100 000 000 so'm",
                      style: TextStyle(
                          color: Color(0xFF043F3B),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "E'lon berilgan kun",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF939598)),
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      child: Text(
                        "25.08.2022",
                        style: TextStyle(
                            color: Color(0xFF414042),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        Container(
          height: 79.h,
          width: 375.w,
          color: Color(0xFFF2FEFC),
          child: Container(
            margin: EdgeInsets.only(
                right: 20, top: 12, bottom: 12, left: 20),
            child: Column(children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "To'plandi",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF739E96)),
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        child: Text(
                          "1 000 000 so'm",
                          style: TextStyle(
                              color: Color(0xFF043F3B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text(
                            "Bajarildi",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF739E96)),
                          ),
                        ),
                        SizedBox(height: 3),
                        Container(
                          child: Text(
                            "60%",
                            style: TextStyle(
                                color: Color(0xFF0344A7),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 7.h,
                width: 375.w,
                margin: EdgeInsets.only(top: 9),
                child: LinearPercentIndicator(
                  animation: true,
                  padding: EdgeInsets.all(0),
                  lineHeight: 7.h,
                  animationDuration: 2000,
                  percent: 0.60,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: AppColorUtils.PERCENT_COLOR,
                  backgroundColor: AppColorUtils.WHITE,
                ),
              ),
            ]),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 4),
          child: Row(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Odam qo'lladi",
                      style: TextStyle(color: Color(0xFF739E96)),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(

                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 20,
                            width: 35,
                            child: Text(
                              "+100",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "*",
                              style: TextStyle(
                                  color: Colors.red, fontSize: 10)),
                          TextSpan(
                            text: " Sanagacha to’planishi kerak",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF939598)),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "assets/app_icons/calendar.svg"),
                          SizedBox(width: 5.w),
                          Text(
                            "25.08.2022",
                            style: TextStyle(
                                color: Color(0xFF0344A7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    ),
      Positioned(
        top: 238.h,
        left: 318.w,
        child: Container(
          height: 35.h,
          width: 105.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF0344A7),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 8,bottom: 7, right: 61, left: 24),

              child: SvgPicture.asset("assets/app_icons/dollar_icon.svg")),
        ),

      )
    ]
  );
}