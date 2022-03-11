import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 266.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColorUtils.WHITE),
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: size.height * 0.75,
              child: Column(
                // Important: Remove any padding from the ListView.
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        color: AppColorUtils.LEFT_MENU_BACK,
                        height: 115.h,
                        child: Row(
                          children: [
                            Container(
                              width: 66.w,
                              height: 66.w,
                              child: CircleAvatar(
                                backgroundColor: AppColorUtils.LEFT_MENU_BACK,
                                child: SvgPicture.asset(AppImageUtils.USER),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppWidgets.text(
                                    text: "Fakhriyor",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: AppColorUtils.TEXT_COLOR),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImageUtils.PERSON),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                      ),
                                      child: AppWidgets.text(
                                          text: "Oddiy foydalanuvchi",
                                          color: AppColorUtils.BLUE_PERCENT,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SvgPicture.asset(AppImageUtils.QUESTION),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, right: 15.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 33.w,
                            width: 33.w,
                            child: SvgPicture.asset(AppImageUtils.EDIT),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: AppColorUtils.DIVIDER,
                    height: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.w,
                      right: 20.w,
                      left: 20.w,
                    ),
                    child: ButtonCard(
                      onPress: () {

                      },
                      text: "Volontyor bo'lish",
                      width: 226.w,
                      height: 44.h,
                      color: AppColorUtils.GREEN_ACCENT1,
                      fontWeight: FontWeight.w600,
                      textSize: 16.sp,
                      textColor: AppColorUtils.KRAUDFANDING,
                      visibleIcon: true,
                      addIcon: AppImageUtils.HANDS,
                    ),
                  ),
                  AppWidgets.rowIconText(
                    iconSelect:AppImageUtils.MAIN ,
                    icon: AppImageUtils.MAIN,
                    isActive: context.read<AppPageCubit>().state.pageType==AppPageType.MAIN,
                    text: "Asosiy",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.MAIN);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: context.read<AppPageCubit>().state.pageType==AppPageType.CHARITY,
                    icon: AppImageUtils.HISTORY,
                    iconSelect: AppImageUtils.HISTORY,
                    text: "Xayriya tarixi",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.CHARITY);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    icon: AppImageUtils.PRODUCTS,
                    iconSelect: AppImageUtils.PRODUCTS,
                    text: "Mahsulotlarim",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {},
                  ),
                  AppWidgets.rowIconText(
                    icon: AppImageUtils.RULES,
                    iconSelect: AppImageUtils.RULES,
                    text: "Loyiha qoidalari",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {},
                  ),
                  AppWidgets.rowIconText(
                    icon: AppImageUtils.FAQ,
                    iconSelect: AppImageUtils.FAQ,
                    text: "FAQ",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {},
                  ),
                  AppWidgets.rowIconText(
                    icon: AppImageUtils.ABOUT_US,
                    iconSelect: AppImageUtils.ABOUT_US,
                    text: "Biz haqimizda",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ButtonCard(
                    width: size.width,
                    height: 44.h,
                    onPress: () {},
                    text: "Saqlanganlar",
                    visibleIcon: true,
                    color: AppColorUtils.GREEN_ACCENT2,
                    fontWeight: FontWeight.w500,
                    textColor: AppColorUtils.GREEN_TEXT,
                    textSize: 16.sp,
                    addIcon: AppImageUtils.HEART,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 12.w,
                    bottom: 12.w,
                  ),
                  child: ButtonCard(
                    width: size.width,
                    height: 44.h,
                    onPress: () {},
                    text: "Operatorga yozish",
                    visibleIcon: true,
                    color: AppColorUtils.BLUE_ACCENT1,
                    fontWeight: FontWeight.w500,
                    textColor: AppColorUtils.BLUE_PERCENT,
                    textSize: 16.sp,
                    addIcon: AppImageUtils.HEADPHONE,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 44.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(AppImageUtils.LOGOUT1),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SvgPicture.asset(AppImageUtils.LOGOUT2),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          AppWidgets.textLocale(
                            text: "Chiqish",
                            color: AppColorUtils.BLACK,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
