import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_detail_page_header.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../kraudfanding_page.dart';
import '../kraudfanding_widget/kraudfanding_widgets.dart';

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
              onTap: () {
                NavigatorService.to.pushNamedAndRemoveUntil(KraudFandingPage.routeName);
              },
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0)),
              child: projectHeader(context)
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 375.w,
              height: 1046.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0)),
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
                  SizedBox(
                    height: 6.h,
                  ),
                  Container(
                    child: SingleChildScrollView(
                        child: Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Column(
                        children: [
                          listDetail(
                              "Lorem",
                              "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                          listDetail(
                              "Lorem",
                              "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                          listDetail(
                              "Lorem",
                              "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                          listDetail(
                              "Lorem",
                              "Lorem Ipsum is simply dummy text of the printing and "
                                  "typesetting industry. Lorem Ipsum has been the industry's standard dummy "
                                  "text ever since the 1500s, when an unknown printer took a galley of type "
                                  "and scrambled it to make a type specimen book"),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 218.h,
                    width: 335.w,
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    height: 48.h,
                    child: Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 275.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF0BBF90)),
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text("Loyihani qo'llash",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                        ),
                        SizedBox(width: 13.h),
                        Container(
                          height: 48.h,
                          width: 48.h,
                          child: SvgPicture.asset(
                              "assets/app_icons/like_detail.svg"),
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
