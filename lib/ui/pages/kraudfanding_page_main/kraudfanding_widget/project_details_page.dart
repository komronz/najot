import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/kraudfanding_widget/project_details_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/utils/app_color_utils.dart';
import 'kraudfanding_widgets.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const String routeName = "/projectDetailsPage";

  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF6FCFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF6FCFA),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 31.w,
                height: 34.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFECFCF1),
                ),
                child: Icon(
                  Icons.chevron_left,
                  size: 30.0.h,
                  color: Color(0xFF004D39),
                ),
              ),
            ),
            SizedBox(width: 71.w),
            Text(
              "Loyiha haqida",
              style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF414042)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 741.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(11.0)),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: 18, right: 20, left: 20, bottom: 18),
                    padding: EdgeInsets.all(4.0),
                    height: 46,
                    width: 335,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8FFFE),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Color(0xFFB7E4DB))),
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
                      margin:
                          EdgeInsets.only(right: 20, top: 12, bottom: 12, left: 20),
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
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 4),
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Odam qo'lladi",style: TextStyle(color: Color(0xFF739E96)),),
                              Container(
                                child: Row(
                                  children: [
                                    Container(),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 20,
                                      width: 35,
                                      child: Text("+100",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
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
            ),
            SizedBox(height: 24.h,),
            Container(
              padding:EdgeInsets.all(20),
              width: 375.w,
              height: 1046.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(11.0)),
              child: Column(
                children: [
                  Container(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              singleTabDetail(true, "Batafsil"),
                              singleTabDetail(false, "Yangiliklar"),
                              singleTabDetail(false, "Berilgan savallrr"),
                              singleTabDetail(false, "Izohlar"),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 6.h,),
                  Container(
                    child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Column(
                            children: [
                              listDetail("Lorem", "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                              listDetail("Lorem", "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                              listDetail("Lorem", "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                              listDetail("Lorem", "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),

                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    height: 218.h,
                    width: 335.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12),),
                      child: Image.asset(
                        "assets/images/rasm.jpg",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    height: 48.h,
                    child: Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 275.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF0BBF90)
                          ),
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Loyihani qo'llash",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600))),
                        ),
                        SizedBox(width: 13.h),
                        Container(
                          height: 48.h,
                          width: 48.h,
                          child: SvgPicture.asset("assets/app_icons/like_detail.svg"),
                        )
                      ],
                    ),

                  ),
                ],
              ),


            ),
          ],
        ),
      ),
    ));
  }
}
