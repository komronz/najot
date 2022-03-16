import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';
import 'my_profile_pages/number_update_page.dart';
import 'my_profile_pages/user_degree_page.dart';
import 'my_profile_pages/user_update_page.dart';

class MyProfilePage extends StatefulWidget {
  static const String routeName = "/myProfilePage";

  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Container(
                  color: Color(0xFFF6FCFA),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(AppImageUtils.MENU),
                        onTap: () {
                        },
                      ),
                      AppWidgets.textLocale(
                        text: "my_profile",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF414042)
                      ),
                      InkWell(
                          child: AppWidgets.imageSvg(path:AppImageUtils.EDIT),
                        onTap: (){
                          NavigatorService.to
                              .pushNamed(UserUpdatePage.routeName);

                        },
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: 375.w,
                    padding: EdgeInsets.only(left: 19,right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColorUtils.WHITE,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 25.h),
                        Container(
                          width: 107.w,
                          height: 107.h,
                          child: SvgPicture.asset(AppImageUtils.USER),
                        ).paddingOnly(bottom: 12.h),
                        Container(
                          width: 65.w,
                          child: Row(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(text: "degree",fontSize: 12.sp,color: Color(0xFFBCBEC0),fontWeight: FontWeight.w400),
                              Container(
                                padding: EdgeInsets.only(top: 1,bottom: 1),
                                  child: InkWell(
                                    onTap: (){
                                      NavigatorService.to
                                          .pushNamed(UserDegreePage.routeName);
                                    },
                                      child: SvgPicture.asset(AppImageUtils.FAQ,color: Color(0xFF007A58),)))
                            ],
                          ),
                        ).paddingOnly(bottom: 6.h),
                        Container(
                          width: 190.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImageUtils.PERSON),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                  child: AppWidgets.textLocale(text: "Normal_user",color: Color(0xFF0344A7),fontSize: 16.sp,fontWeight: FontWeight.w600),)
                            ],
                          ),

                        ).paddingOnly(bottom: 24.h),
                        Container(
                          width: 336.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(text: "Name",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400).paddingOnly(bottom: 7.h),
                              Container(
                                padding: EdgeInsets.only(left: 18),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFFEDFCF9),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFFCEE1DD),
                                    )),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Fakhriyor",
                                    border: InputBorder.none,
                                    hintStyle:
                                    TextStyle(color: Color(0xFFBCBEC0), fontSize: 15.sp,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ).paddingOnly(bottom: 24.h),
                              AppWidgets.textLocale(text: "Surname",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400).paddingOnly(bottom: 7.h),
                              Container(
                                padding: EdgeInsets.only(left: 18),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFFEDFCF9),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFFCEE1DD),
                                    )),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Eshonov",
                                    border: InputBorder.none,
                                    hintStyle:
                                    TextStyle(color: Color(0xFFBCBEC0), fontSize: 15.sp,fontWeight: FontWeight.w500),
                                  ),
                                ),

                              ).paddingOnly(bottom: 24.h),
                              AppWidgets.textLocale(text: "Gender", color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400).paddingOnly(bottom: 8.h),

                              Row(
                                children: [
                                  Container(
                                    height: 48.h,
                                    width: 114.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFFEDFCF9),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFFCEE1DD),
                                        )),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                              color: Color(0xFFEDFCF9),
                                              border: Border.all(
                                                width: 1,
                                                color: Color(0xFFCEE1DD),
                                              ),
                                          ),
                                        ),
                                        AppWidgets.textLocale(text: "Man",fontSize: 15.sp,color: Color(0xFFA8C5BF),fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                  ).paddingOnly(right: 24.h),
                                  Container(
                                    height: 48.h,
                                    width: 103.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFFEDFCF9),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFFCEE1DD),
                                        )),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                              color: Color(0xFFEDFCF9),
                                              border: Border.all(
                                                width: 1,
                                                color: Color(0xFFCEE1DD),
                                              ),
                                          ),
                                        ),
                                        AppWidgets.textLocale(text: "Woman",fontSize: 15.sp,color: Color(0xFFA8C5BF),fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 24.h),
                        Divider(
                          thickness: 2,
                          color: Color(0xFFE6EDEC),
                        ).paddingOnly(bottom: 24.h),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(text: "Phone_number",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Container(
                                    width: 283.w,
                                    padding: EdgeInsets.only(left: 18),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFFEDFCF9),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFFCEE1DD),
                                        )),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "+998976282882",
                                        border: InputBorder.none,
                                        hintStyle:
                                        TextStyle(color: Color(0xFFBCBEC0), fontSize: 16,fontWeight: FontWeight.w500),
                                      ),
                                    ),

                                  ).paddingOnly(right: 19.w),
                                  InkWell(
                                    onTap: (){
                                      NavigatorService.to
                                          .pushNamed(NumberUpdatePage.routeName);
                                    },
                                    child: Container(
                                      height: 33.h,
                                      width: 33.w,
                                      child: SvgPicture.asset(AppImageUtils.EDIT),


                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
