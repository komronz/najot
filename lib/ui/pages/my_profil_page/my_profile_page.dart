import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/services/navigator_service.dart';

import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
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
          body: Column(
            children: [
              Container(
                color: Color(0xFFF6FCFA),
                height: 80,
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
                      text: "My Profile",
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
              Expanded(
                child: Container(
                  height: 758.h,
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
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 17.h,
                        width: 65.w,
                        child: Row(
                          children: [
                            AppWidgets.textLocale(text: "Degree",fontSize: 12.sp,color: Color(0xFFBCBEC0),fontWeight: FontWeight.w400),
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
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        height: 28.h,
                        width: 185.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImageUtils.PERSON),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                                child: AppWidgets.textLocale(text: "Oddiy foydalanuvchi",color: Color(0xFF0344A7),fontSize: 16.sp,fontWeight: FontWeight.w600),)
                          ],
                        ),

                      ),
                      SizedBox(height: 24.h),
                      Container(
                        height: 275.h,
                        width: 336.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(text: "Ism",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400),
                            SizedBox(height: 8.h),
                            Container(
                              height: 48.h,
                              padding: EdgeInsets.only(left: 18,top: 18,bottom: 10),
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

                            ),
                            SizedBox(height: 23.h),
                            AppWidgets.textLocale(text: "Familiya",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400),
                            SizedBox(height: 8.h),
                            Container(
                              height: 48.h,
                              padding: EdgeInsets.only(left: 18,top: 18,bottom: 10),
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

                            ),
                            SizedBox(height: 24.h),
                            AppWidgets.textLocale(text: "Jinsi", color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400),
                            SizedBox(height: 8.h),
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
                                      AppWidgets.textLocale(text: "Erkak",fontSize: 15.sp,color: Color(0xFFA8C5BF),fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                                SizedBox(width: 30.w),
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
                                      AppWidgets.textLocale(text: "Ayol",fontSize: 16,color: Color(0xFFA8C5BF),fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                              ],
                            ),



                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Divider(
                        thickness: 2,
                        color: Color(0xFFE6EDEC),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(text: "Telefon raqami",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Container(
                                  height: 48.h,
                                  width: 283.w,
                                  padding: EdgeInsets.only(left: 18,top: 18,bottom: 10),
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

                                ),
                                SizedBox(width: 19.w),
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
    );
  }
}
