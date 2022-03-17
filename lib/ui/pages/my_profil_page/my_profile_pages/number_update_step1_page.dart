import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'number_update_step2_page.dart';

class NumberUpdateStep1Page extends StatelessWidget {
  static const String routeName = "/numberUpdateStep1Page";

  const NumberUpdateStep1Page({Key? key}) : super(key: key);

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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 19, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorUtils.WHITE,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.textLocale(text: "Phone_number",color: Color(0xFF6D6E71),fontSize: 13.sp,fontWeight: FontWeight.w400).paddingOnly(top: 24,bottom: 8),
                          Container(
                            width: 335.w,
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
                                hintText: "(+998)97 628 28 82",
                                border: InputBorder.none,
                                hintStyle:
                                TextStyle(color: Color(0xFFBCBEC0), fontSize: 16,fontWeight: FontWeight.w500),
                              ),
                            ),

                          ),
                        ],
                      ).paddingOnly(bottom: 24.h),
                      Container(
                        width: 336.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                                text: "New_phone_number",
                                color: Color(0xFF6D6E71),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400).paddingOnly(bottom: 8.h),
                            Container(
                              padding:
                              EdgeInsets.only(left: 18, ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFDFFFF),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xFF79B4A8),
                                  )),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "+998",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xFF6D6E71),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ).paddingOnly(bottom: 16.h),
                            Container(
                                width: 116.w,
                                padding: EdgeInsets.only( top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFDFFFF),
                                  border: Border.all(color: Color(0xFF97C2BA),
                                  width: 2),
                                ),
                                child: AppWidgets.textLocale(text: "1 2 3 4 5 6",textAlign:TextAlign.center ,color: Color(0xFFBCBEC0),fontSize: 15.sp,fontWeight: FontWeight.w600),
                              ),
                            SizedBox(height: 16.h),
                            InkWell(
                              onTap: (){
                                NavigatorService.to
                                    .pushNamed(NumberUpdateStep2Page.routeName);
                              },
                              child: Container(
                                width: 335.w,
                                padding: EdgeInsets.only( top: 10, bottom: 13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF0BBF90),
                                ),
                                child: AppWidgets.textLocale(text: "Confirmation",textAlign:TextAlign.center ,color: Color(0xFFFFFFFF),fontSize: 15.sp,fontWeight: FontWeight.w600),
                              ),
                            ).paddingOnly(bottom: 18.h),
                            Container(
                              margin: EdgeInsets.only(left: 120),
                              width: 200.w,
                              child: AppWidgets.textLocale(text: "Qayta yuborish",color: Color(0xFF0B58B2),fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
