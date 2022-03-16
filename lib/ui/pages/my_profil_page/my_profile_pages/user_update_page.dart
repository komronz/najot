import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class UserUpdatePage extends StatefulWidget {
  static const String routeName = "/userUpdatePage";

  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color(0xFFF6FCFA),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(AppImageUtils.MENU),
                    onTap: () {},
                  ),
                  AppWidgets.textLocale(
                      text: "Edit",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)),
                  InkWell(
                    child: SvgPicture.asset(AppImageUtils.REMOVE),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: 375.w,
                padding: EdgeInsets.only(left: 19, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorUtils.WHITE,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 107.w,
                      height: 129.h,
                      child: SvgPicture.asset(AppImageUtils.USERADD),
                    ).paddingOnly(top: 25, bottom: 24),
                    Container(
                      width: 336.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.textLocale(
                              text: "Name",
                              color: Color(0xFF6D6E71),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400).paddingOnly(bottom: 8.h),
                          Container(
                            padding:
                                EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFFDFFFF),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xFF79B4A8),
                                )),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Fakhriyor",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xFFBCBEC0),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ).paddingOnly(bottom: 23.h),
                          AppWidgets.textLocale(
                            text: "Surname",
                            color: Color(0xFF6D6E71),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            padding:
                                EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFFDFFFF),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xFF79B4A8),
                                )),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Eshonov",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color(0xFFBCBEC0),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ).paddingOnly(bottom: 20.h),
                          AppWidgets.textLocale(
                              text: "Gender",
                              color: Color(0xFF6D6E71),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                width: 114.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFFFFFFFF),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFF048D6A),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2.0),
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF048D6A),
                                        ),
                                      ),
                                      child: Container(
                                        height: 18.h,
                                        width: 18.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xFF048D6A),
                                        ),
                                      ),
                                    ),
                                    AppWidgets.textLocale(
                                      text: "Man",
                                      fontSize: 15.sp,
                                      color: Color(0xFF048D6A),
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ).paddingOnly(right: 30.w),
                              Container(
                                height: 48.h,
                                width: 103.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFFFFFFFF),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFF939598),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF939598),
                                        ),
                                      ),
                                    ),
                                    AppWidgets.textLocale(
                                        text: "Woman",
                                        fontSize: 15.sp,
                                        color: Color(0xFF414042),
                                        fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).paddingOnly(bottom: 24.h),
                    Container(
                      width: 335.w,
                      padding: EdgeInsets.only( top: 10, bottom: 15,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF0BBF90),
                          ),
                      child: AppWidgets.textLocale(text: "Save",textAlign:TextAlign.center ,color: Color(0xFFFFFFFF),fontSize: 15.sp,fontWeight: FontWeight.w600),
                    )
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
