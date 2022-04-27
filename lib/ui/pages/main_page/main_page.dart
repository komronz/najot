import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/home_page/widget/carousel_slider_widget.dart';
import 'package:najot/ui/pages/home_page/widget/icon_name_widget.dart';
import 'package:najot/ui/pages/home_page/widget/kraudfanding_card_widget.dart';
import 'package:najot/ui/pages/home_page/widget/volunteer_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/kraudfanding_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../notification_page/notification_page.dart';
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";
  HomeCubit cubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Container(
              color: AppColorUtils.BACKGROUND,
              child: Column(
                children: [
                  SizedBox(height: 20.w,),
                  AppWidgets.appBarMenu(
                    title: LocaleKeys.main.tr(),
                    onTapMenu: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    visibleIcon: true,
                    onTapIcon: (){
                      NavigatorService.to.pushNamed(NotificationPage.routeName,);

                    },
                    icon:AppImageUtils.NOTIFICATION,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSliderWidget(sliderList: state.sliderList),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(
                                text: LocaleKeys.category,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                              ).paddingOnly(left: 20.w),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, top: 10, bottom: 20, left: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndName(
                                      text: LocaleKeys.crowdfunding.tr(),
                                      icon: AppImageUtils.KRAUDFANDING,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 14,
                                      color: AppColorUtils.KRAUDFANDING,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  KraudfandingPage(),
                                            ));
                                      },
                                    ),
                                    IconAndName(
                                      text: LocaleKeys.volunteering.tr(),
                                      icon: AppImageUtils.VOLONTYOR,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 14,
                                      color: AppColorUtils.VOLONTYOR,

                                      onTap: () {
                                        NavigatorService.to
                                            .pushNamed(VolunteerPage.routeName);
                                      },

                                    ),
                                    IconAndName(
                                      text: LocaleKeys.charity.tr(),
                                      icon: AppImageUtils.CHARITY,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 14,
                                      color: AppColorUtils.CHARITY,
                                      onTap: () {
                                        NavigatorService.to
                                            .pushNamed(CharityPage.routeName);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              AppWidgets.textLocale(
                                text: LocaleKeys.crowdfunding,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                              ).paddingOnly(left: 20.w),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 300.w,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      state.sliderList.length,
                                      (index) => Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: KraudfandingCardWidget(
                                          sliderModel:
                                              state.sliderList[index],
                                          visible: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AppWidgets.textLocale(
                                text: LocaleKeys.volunteering,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                              ).paddingOnly(
                                left: 20.w,
                                top: 20.h,
                              ),
                              SizedBox(
                                height: 300.w,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      state.sliderList.length,
                                      (index) => Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: VolunteerCardWidget(
                                          sliderModel:
                                              state.sliderList[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AppWidgets.textLocale(
                                text: LocaleKeys.charity,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.sp,
                              ).paddingOnly(
                                  left: 20.w, top: 10.h, bottom: 10.h),
                              SizedBox(
                                height: 300.w,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      state.sliderList.length,
                                      (index) => Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: KraudfandingCardWidget(
                                          sliderModel:
                                              state.sliderList[index],
                                          visible: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
