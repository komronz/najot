import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profile_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'number_update_step1_page.dart';

class NumberUpdatePage extends StatelessWidget {
  static const String routeName = "/numberUpdatePage";

  NumberUpdatePage({Key? key }) : super(key: key);
  bool isVisible=true;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>MyProfileCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColorUtils.WHITE,
          body: BlocBuilder<MyProfileCubit,MyProfileState>(
            builder: (context, state) {
              return Column(
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
                            text: "edit_my_profile",
                            fontSize: 24.sp,
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
                                AppWidgets.textLocale(
                                    text: "Phone_number",
                                    color: Color(0xFF6D6E71),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400)
                                    .paddingOnly(top: 24.h, bottom: 8.h),
                                Container(
                                  width: double.infinity,
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
                                      enabled: false,
                                      hintText: "(+998)97 628 28 82",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Color(0xFFBCBEC0),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingOnly(bottom: 24.h),
                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidgets.textLocale(
                                      text: "New_phone_number",
                                      color: Color(0xFF6D6E71),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(height: 8.h),
                                  Container(
                                    padding: EdgeInsets.only(left: 18),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFFFDFFFF),
                                        border: Border.all(
                                          width: 2,
                                          color: Color(0xFF79B4A8),
                                        )),
                                    child:
                                    TextField(
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
                                  InkWell(
                                    onTap: () {
                                      context.read<MyProfileCubit>().changePageNext(isVisible);
                                    },
                                    child: state.isVisibled? Visibility(
                                      visible: isVisible,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 13,
                                            right: 10,
                                            left: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xFF1F6ADE),
                                          ),
                                          child: AppWidgets.textLocale(
                                              text: "Send_code",
                                              textAlign: TextAlign.center,
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                    ): NumberUpdateStep1Page(),
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
              );
            }),
          )
        ),

    );

  }
}
