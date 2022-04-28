import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/user_degree_widgets.dart';

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
              color: AppColorUtils.BACKGROUND,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    child: InkWell(
                      child: SvgPicture.asset(AppImageUtils.BACK_TO),
                      onTap: () {
                        NavigatorService.to.pushNamed(MyProfilePage.routeName);
                      },
                    ),
                  ),
                  SizedBox(width: 93.w),
                  AppWidgets.textLocale(
                    text: LocaleKeys.degrees,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.DARK2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorUtils.WHITE,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: AppWidgets.textLocale(
                          text: LocaleKeys.degree_types,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                            color: AppColorUtils.DARK2,
                        ),
                      ).paddingOnly(top: 18.h, bottom: 10.h),
                      Container(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing "
                          "and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                          style: TextStyle(
                            color: AppColorUtils.DARK3,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: 1.5,
                          ),
                        ),
                      ).paddingOnly(bottom: 24.h),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImageUtils.PERSON),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AppWidgets.textLocale(
                                  text: LocaleKeys.normal_user,
                                  color: AppColorUtils.BLUE_PERCENT,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 12.h),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                              text: LocaleKeys.opportunities,
                              color: AppColorUtils.DARK3,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 14.w,
                                    width: 14.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColorUtils.WHITE,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColorUtils.BLUE_PERCENT,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                        AppImageUtils.CHECK_SMALL,
                                    ),
                                  ).paddingOnly(bottom: 8.h),
                                  SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.doing_charity.tr(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColorUtils.DARK_4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.excluding_clothing_donations.tr(),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColorUtils.DARK_4,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingOnly(bottom: 13.h),
                            blueCheckWidgets(title: LocaleKeys.buy_reward.tr(),)
                                .paddingOnly(bottom: 13.h),
                            blueCheckWidgets(title: LocaleKeys.apply_for_projects.tr(),)
                                .paddingOnly(bottom: 13.h),
                            blueCheckWidgets(title: LocaleKeys.ask_questions.tr(),)
                                .paddingOnly(bottom: 13.h),
                            blueCheckWidgets(title: LocaleKeys.leave_comment.tr(),),
                          ],
                        ),
                      ).paddingOnly(bottom: 18.h),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImageUtils.VOLONTORGREEN),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: AppWidgets.textLocale(
                                text: LocaleKeys.volunteer.tr(),
                                color: AppColorUtils.KRAUDFANDING,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 12.h),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                              text: LocaleKeys.opportunities.tr(),
                              color: AppColorUtils.DARK3,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 12.h),
                            greenCheckWidgets(
                              title:
                                  LocaleKeys.options_average_user.tr(),
                            ),
                            greenCheckWidgets(
                              title: LocaleKeys
                                  .use_volunteer_category
                                  .tr(),
                            ),
                            greenCheckWidgets(
                              title: LocaleKeys.clothes_charity.tr(),
                            ),
                            greenCheckWidgets(
                              title: LocaleKeys.receive_gifts_project
                                  .tr(),
                            ),
                            greenCheckWidgets(
                              title: LocaleKeys.add_project.tr(),
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
