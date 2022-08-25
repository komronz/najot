import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/crowdfunding_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/main_page/widgets/carousel_slider_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/charity_list_main.dart';
import 'package:najot/ui/pages/main_page/widgets/crowdfunding_list_main.dart';
import 'package:najot/ui/pages/main_page/widgets/icon_name_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/volunteer_list_main.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_page.dart';
import 'package:najot/ui/widgets/app_error_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../data/bloc/app_page_cubit/app_page_cubit.dart';
import '../../../data/bloc/volunteer_bloc/volunteer_cubit.dart';
import '../notification_page/notification_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";
  HomeCubit homeCubit = HomeCubit.to;

  @override
  Widget build(BuildContext context) {
    CharityCubit.to.load();
    CrowdfundingCubit.to.load();
    VolunteerCubit.to.load();
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => homeCubit..getModel(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state.internetConnection) {
              if (!state.progress) {
                return Container(
                  color: AppColorUtils.BACKGROUND,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                      ),
                      AppWidgets.appBarMenu(
                        title: LocaleKeys.main.tr(),
                        onTapMenu: () {
                          HomePage.globalKey.currentState!.openDrawer();
                          AppPageCubit.to.getUser();
                        },
                        visibleIcon: true,
                        onTapIcon: () {
                          NavigatorService.to.pushNamed(
                            NotificationPage.routeName,
                          );
                        },
                        icon: AppImageUtils.NOTIFICATION,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSliderWidget(sliderList: state.slider),
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
                                      right: 20,
                                      top: 10,
                                      bottom: 20,
                                      left: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndName(
                                          text: LocaleKeys.crowdfunding.tr(),
                                          icon: AppImageUtils.KRAUDFANDING,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                          color: AppColorUtils.KRAUDFANDING,
                                          onTap: () {
                                            CrowdfundingCubit
                                                .to.state.searchProjects = [];
                                            VolunteerCubit
                                                .to.state.searchChange = "";
                                            NavigatorService.to.pushNamed(
                                              CrowdfundingPage.routeName,
                                            );
                                          },
                                        ),
                                        IconAndName(
                                          text: LocaleKeys.volunteering.tr(),
                                          icon: AppImageUtils.VOLONTYOR,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                          color: AppColorUtils.VOLONTYOR,
                                          onTap: () {
                                            VolunteerCubit
                                                .to.state.searchProjects = [];
                                            VolunteerCubit
                                                .to.state.searchChange = "";
                                            NavigatorService.to.pushNamed(
                                              VolunteerPage.routeName,
                                            );
                                          },
                                        ),
                                        IconAndName(
                                          text: LocaleKeys.charity.tr(),
                                          icon: AppImageUtils.CHARITY,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                          color: AppColorUtils.CHARITY,
                                          onTap: () {
                                            CharityCubit
                                                .to.state.searchProjects = [];
                                            CharityCubit.to.state.searchChange =
                                                "";
                                            NavigatorService.to.pushNamed(
                                              CharityPage.routeName,
                                            );
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
                                    height: 10.w,
                                  ),
                                  CrowdFundingListMain(
                                    homeCubit: homeCubit,
                                    state: state,
                                  ),
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.volunteering,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp,
                                  ).paddingOnly(
                                    left: 20.w,
                                    top: 20.w,
                                  ),
                                  VolunteerListMain(
                                    homeCubit: homeCubit,
                                    state: state,
                                  ),
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.charity,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp,
                                  ).paddingOnly(
                                    left: 20.w,
                                    top: 10.w,
                                    bottom: 10.w,
                                  ),
                                  CharityListMain(
                                    homeCubit: homeCubit,
                                    state: state,
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
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return AppErrorWidget(onTap: () async {
                AppWidgets.isLoading(true);
                await homeCubit.getModel();
                AppWidgets.isLoading(false);
              });
            }
          },
        ),
      ),
    );
  }
}






