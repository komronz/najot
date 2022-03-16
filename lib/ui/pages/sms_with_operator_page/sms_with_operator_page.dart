import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../my_profil_page/my_profile_pages/user_update_page.dart';

class SmsWithOperatorPage extends StatelessWidget {
  static const String routeName = "/smsWithOperatorPage";
  const SmsWithOperatorPage({Key? key}) : super(key: key);

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
                    onTap: () {},
                  ),
                  AppWidgets.textLocale(
                      text: "write_operator",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)),
                  InkWell(
                    child: SvgPicture.asset(AppImageUtils.DELETE),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 701.h,
                width: 375.w,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorUtils.WHITE,
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 118.h),
                    Container(
                      height: 93.h,
                      width: 93.w,
                      child: SvgPicture.asset(AppImageUtils.MESSAGE),
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      height: 62.h,
                      child: AppWidgets.textLocale(text: "Hozircha hech qanday xabar topilmadi",textAlign: TextAlign.center,
                          color: Color(0xFFBCBEC0),fontSize: 18.sp,fontWeight: FontWeight.w600,maxLines: 2,),
                    ).paddingOnly(right: 86,left: 86),
                    SizedBox(height: 268.h),
                    Container(
                      margin: EdgeInsets.only(left: 3,right: 3),
                      padding: EdgeInsets.only(left: 17,right: 17),
                      height: 149.h,
                      width: 375.w,
                      color: Color(0xFFF9FEFC),
                      child: Row(
                        children: [
                          Container(
                            height: 110.h,
                            width: 279.w,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFF79B4A8),width: 1),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText:"send_message",
                                border: InputBorder.none
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 19,left: 11,bottom: 18),
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFEAEAEA),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 11),
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF0BBF90),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),

                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
