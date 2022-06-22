import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/services/volunteer_service.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AppPageState state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppPageType pageType = context.read<AppPageCubit>().state.pageType;
    return Container(
      width: 266.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColorUtils.white,
      ),
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.75,
              child: Column(
                // Important: Remove any padding from the ListView.
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        color: AppColorUtils.leftMenuBack,
                        height: 115.h,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 66.w,
                              height: 66.w,
                              child: CircleAvatar(
                                backgroundColor: AppColorUtils.leftMenuBack,
                                child: SvgPicture.asset(AppImageUtils.user),
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
                                  text: "Fakhriyor",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColorUtils.textColor,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImageUtils.person),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                      ),
                                      child: AppWidgets.text(
                                        text: state.tobeVolunteer
                                            ? LocaleKeys.volunteer.tr()
                                            : LocaleKeys.normal_user.tr(),
                                        color: AppColorUtils.bluePercent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset(AppImageUtils.question),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h, right: 15.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 33.w,
                              width: 33.w,
                              child: SvgPicture.asset(AppImageUtils.edit),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (state.tobeVolunteer) {
                            context
                                .read<AppPageCubit>()
                                .changePage(pageType: AppPageType.profile);
                            Navigator.pop(context);
                          } else {
                            context
                                .read<AppPageCubit>()
                                .changePage(pageType: AppPageType.userprofile);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                  const Divider(
                    color: AppColorUtils.divider,
                    height: 1,
                    thickness: 1,
                  ),
                  state.tobeVolunteer
                      ? const SizedBox()
                      : ButtonCard(
                          onPress: () {
                            context.read<AppPageCubit>().changePage(
                                  pageType: AppPageType.volunteer,
                                );
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.be_volunteer.tr(),
                          width: 226.w,
                          height: 44.h,
                          color: AppColorUtils.greenAccent1,
                          fontWeight: FontWeight.w600,
                          textSize: 16.sp,
                          textColor: AppColorUtils.kraudfanding,
                          visibleIcon: true,
                          addIcon: AppImageUtils.hands,
                        ).paddingOnly(
                          top: 20.w,
                          right: 20.w,
                          left: 20.w,
                        ),
                  AppWidgets.rowIconText(
                    iconSelect: AppImageUtils.main,
                    icon: AppImageUtils.main2,
                    isActive: pageType == AppPageType.main,
                    text: LocaleKeys.main.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.main);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.charity,
                    icon: AppImageUtils.history,
                    iconSelect: AppImageUtils.history2,
                    text: LocaleKeys.my_services.tr(),
                    fontSize: 16.sp,
                    direction: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context.read<AppPageCubit>().changeMenu(2);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.organizations,
                    icon: AppImageUtils.organization,
                    iconSelect: AppImageUtils.organization2,
                    text: LocaleKeys.organizations.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14.w,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.organizations);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.rules,
                    icon: AppImageUtils.rules,
                    iconSelect: AppImageUtils.rules2,
                    text: LocaleKeys.project_rules,
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.rules);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.faq,
                    icon: AppImageUtils.faq,
                    iconSelect: AppImageUtils.faq2,
                    text: "FAQ",
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.faq);
                      Navigator.pop(context);
                    },
                  ),
                  AppWidgets.rowIconText(
                    isActive: pageType == AppPageType.about,
                    icon: AppImageUtils.aboutUs,
                    iconSelect: AppImageUtils.aboutUs2,
                    text: LocaleKeys.about_us.tr(),
                    fontSize: 16.sp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14,
                    ),
                    onTap: () {
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.about);
                      Navigator.pop(context);
                    },
                  ),
                  FlutterSwitch(
                    showOnOff: true,
                    value: state.tobeVolunteer,
                    onToggle: (v) {
                      Volunteer.tobeVolunteer = !Volunteer.tobeVolunteer;
                      context
                          .read<AppPageCubit>()
                          .changeVolunteer(Volunteer.tobeVolunteer);
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
                      context
                          .read<AppPageCubit>()
                          .changePage(pageType: AppPageType.saved);
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.saved,
                    visibleIcon: true,
                    color: AppColorUtils.greenAccent2,
                    fontWeight: FontWeight.w500,
                    textColor: AppColorUtils.greenText,
                    textSize: 16.sp,
                    addIcon: AppImageUtils.heart,
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
                      context.read<AppPageCubit>().changePage(
                            pageType: AppPageType.operator,
                          );
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.write_operator,
                    visibleIcon: true,
                    color: AppColorUtils.blueAccent1,
                    fontWeight: FontWeight.w500,
                    textColor: AppColorUtils.bluePercent,
                    textSize: 16.sp,
                    addIcon: AppImageUtils.headphone,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: InkWell(
                    onTap: () {
                      exit(0);
                    },
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
                              SvgPicture.asset(AppImageUtils.logout1),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SvgPicture.asset(AppImageUtils.logout2),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.exit,
                            color: AppColorUtils.black,
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
