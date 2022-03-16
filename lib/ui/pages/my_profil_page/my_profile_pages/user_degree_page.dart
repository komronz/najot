import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class UserDegreePage extends StatelessWidget {
  static const String routeName = "/userDegreePage";

  const UserDegreePage({Key? key}) : super(key: key);

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

                children: [
                  Container(
                    child: InkWell(
                      child: SvgPicture.asset(AppImageUtils.BACK_TO),
                      onTap: () {
                        NavigatorService.to
                            .pushNamed(MyProfilePage.routeName);
                      },
                    ),
                  ),
                  SizedBox(width: 93.w),
                  AppWidgets.textLocale(
                      text: "Darajalar",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 758.h,
                width: 375.w,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorUtils.WHITE,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.h),
                      Container(
                        child: AppWidgets.textLocale(text: "Daraja turlari",fontSize: 22.sp,fontWeight: FontWeight.w600,color: Color(0xFF414042)),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        child: Text("Lorem Ipsum is simply dummy text of the printing "
                            "and typesetting industry. "
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                          style:TextStyle(color: Color(0xFF58595B),fontWeight: FontWeight.w400,fontSize: 16.sp,height: 1.5),),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        height: 28.h,
                        width: 200.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImageUtils.PERSON),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AppWidgets.textLocale(text: "Oddiy foydalanuvchi",color: Color(0xFF0344A7),fontSize: 16.sp,fontWeight: FontWeight.w600),)
                          ],
                        ),

                      ),
                      SizedBox(height: 12.h),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(text: "Imkoniyatlari",color: Color(0xFF58595B),fontSize: 13.sp,fontWeight: FontWeight.w600),
                            SizedBox(height: 12.h),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFFFFFFF),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xFF0344A7),
                                      )
                                    ),
                                     child: SvgPicture.asset(AppImageUtils.CHECK_SMALL),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Xayriya qilish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),
                                      Text("(kiyimlarni hayriya qilish bundan mustasno)",style: TextStyle(fontSize: 12.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w400),),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 13.h),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF0344A7),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Mukorofot sotib olish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF0344A7),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Loyihalarni qo’llash",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF0344A7),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Savollar berish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF0344A7),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Izoh qoldirish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),
                      Container(
                        height: 28.h,
                        width: 185.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImageUtils.VOLONTORGREEN),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AppWidgets.textLocale(text: "Volontyor",color: Color(0xFF048D6A),fontSize: 18.sp,fontWeight: FontWeight.w600),)
                          ],
                        ),

                      ),
                      SizedBox(height: 12.h),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(text: "Imkoniyatlari",color: Color(0xFF58595B),fontSize: 13.sp,fontWeight: FontWeight.w600),
                            SizedBox(height: 12.h),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF038D69),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL,color: Color(0xFF038D69),),
                                  ),
                                  SizedBox(width: 8),
                                      Text("Oddiy foydalanuvchi barcha imkoniyatlari",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                            Container(
                              height: 40.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF038D69),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL,color: Color(0xFF038D69),),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(child: Text("Volontyorlik kategoriyasidan to’liq foydalana olish",style: TextStyle(height:1.3,fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),)),

                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF038D69),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL,color: Color(0xFF038D69),),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Kiyimlar xayriya qilish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
                            ),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF038D69),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL,color: Color(0xFF038D69),),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(child: Text("Loyiha tomonidan ajoyib sovg’alarni qo’lga kiritish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),)),

                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              height: 37.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.h,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xFF038D69),
                                        )
                                    ),
                                    child: SvgPicture.asset(AppImageUtils.CHECK_SMALL,color:Color(0xFF038D69)),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Loyiha qo’shish",style: TextStyle(fontSize: 14.sp,color: Color(0xFF6D6E71),fontWeight: FontWeight.w500),),

                                ],
                              ),
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
