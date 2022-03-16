import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/tabbar_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/utils/app_color_utils.dart';

Widget projectHeader(BuildContext context) {
  return Stack(children: [
    Column(
      children: [
        SizedBox(
          height: 15.w,
        ),
        TabBarWidget(),
        Container(
          height: 300.w,
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 18.w,
          ),
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
        AppWidgets.text(
          text: "Drenajni kuzatish uchun mo’jallangan moslama",
          fontSize: 20.sp,
          color: AppColorUtils.DARK2,
          fontWeight: FontWeight.w500,
          maxLines: 2,

        ).paddingSymmetric(horizontal: 20.w),

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
                            style: TextStyle(color: Colors.red, fontSize: 10)),
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
            margin: EdgeInsets.only(right: 20, top: 12, bottom: 12, left: 20),
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
                          Container(),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 20,
                            width: 35,
                            child: Text(
                              "+100",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
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
                              style:
                                  TextStyle(color: Colors.red, fontSize: 10)),
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
                          SvgPicture.asset("assets/app_icons/calendar.svg"),
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
            padding: EdgeInsets.only(top: 8, bottom: 7, right: 61, left: 24),
            child: SvgPicture.asset("assets/app_icons/dollar_icon.svg")),
      ),
    )
  ]);
}
