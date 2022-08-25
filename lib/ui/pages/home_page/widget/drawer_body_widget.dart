
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/log_out_dialog.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';


class DrawerBody extends StatelessWidget {
  DrawerBody({
    required this.cubit,
  });

  AppPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppPageType pageType = cubit.state.pageType;
    return Container(
      width: 275.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColorUtils.WHITE,
      ),
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: size.height * 0.76,
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
                              width: 55.w,
                              height: 55.w,
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
                                AppWidgets.textLocale(
                                  text: cubit.state.user!.firstName ?? "",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColorUtils.TEXT_COLOR,
                                ),
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
                                        text: cubit.state.user!.isVolunteer!
                                            ? LocaleKeys.volunteer.tr()
                                            : LocaleKeys.normal_user.tr(),
                                        color: AppColorUtils.BLUE_PERCENT,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset(AppImageUtils.QUESTION),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            right: 15.w,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 33.w,
                              width: 33.w,
                              child: SvgPicture.asset(AppImageUtils.EDIT),
                            ),
                          ),
                        ),
                        onTap: () {
                          cubit.changePage(
                            pageType: AppPageType.USERPROFILE,
                          );
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Divider(
                    color: AppColorUtils.DIVIDER,
                    height: 1,
                    thickness: 1,
                  ),
                  cubit.state.user!.isVolunteer!
                      ? SizedBox()
                      : ButtonCard(
                          onPress: () {
                            cubit.changePage(
                              pageType: AppPageType.VOLUNTEER,
                            );
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.be_volunteer.tr(),
                          width: 226.w,
                          height: 44.h,
                          color: AppColorUtils.GREEN_ACCENT1,
                          fontWeight: FontWeight.w600,
                          textSize: 16.sp,
                          textColor: AppColorUtils.KRAUDFANDING,
                          visibleIcon: true,
                          addIcon: AppImageUtils.HANDS,
                        ).paddingOnly(
                          top: 20.w,
                          right: 20.w,
                          left: 20.w,
                        ),
                  AppWidgets.rowIconText(
                    iconSelect: AppImageUtils.MAIN,
                    icon: AppImageUtils.MAIN2,
                    isActive: pageType == AppPageType.MAIN,
                    text: LocaleKeys.main.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      HomeCubit.to.getModel();
                      cubit.changePage(pageType: AppPageType.MAIN);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.CHARITY,
                    icon: AppImageUtils.HISTORY,
                    iconSelect: AppImageUtils.HISTORY2,
                    text: LocaleKeys.my_services.tr(),
                    fontSize: 16.sp,
                    direction: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      cubit.changeMenu(2);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.ORGANIZATIONS,
                    icon: AppImageUtils.ORGANIZATION,
                    iconSelect: AppImageUtils.ORGANIZATION2,
                    text: LocaleKeys.organizations.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14.w,
                    ),
                    onTap: () {
                      cubit.changePage(
                        pageType: AppPageType.ORGANIZATIONS,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.RULES,
                    icon: AppImageUtils.RULES,
                    iconSelect: AppImageUtils.RULES2,
                    text: LocaleKeys.project_rules,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      cubit.changePage(pageType: AppPageType.RULES);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.FAQ,
                    icon: AppImageUtils.FAQ,
                    iconSelect: AppImageUtils.FAQ2,
                    text: "FAQ",
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      cubit.changePage(pageType: AppPageType.FAQ);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.ABOUT,
                    icon: AppImageUtils.ABOUT_US,
                    iconSelect: AppImageUtils.ABOUT_US2,
                    text: LocaleKeys.about_us.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      cubit.changePage(pageType: AppPageType.ABOUT);
                      Navigator.pop(context);
                    },
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
                    onPress: () {
                      cubit.changePage(pageType: AppPageType.SAVED);
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.saved,
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
                    onPress: () {
                      cubit.changePage(
                        pageType: AppPageType.OPERATOR,
                      );
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.write_operator,
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return LogOutDialog();
                        },
                      );
                    },
                    child: Container(
                      height: 44.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                            text: LocaleKeys.exit,
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
        ).paddingOnly(top: 20.w),
      ),
    );
  }
}
