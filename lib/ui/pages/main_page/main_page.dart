import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page2.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/crowdfunding_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/main_page/widgets/carousel_slider_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/charity_card_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/crowdfunding_card_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/icon_name_widget.dart';
import 'package:najot/ui/pages/main_page/widgets/volunteer_card_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_page.dart';
import 'package:najot/ui/widgets/app_error_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../data/bloc/volunteer_bloc/volunteer_cubit.dart';
import '../notification_page/notification_page.dart';
import '../volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';

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
          create: (BuildContext context) => homeCubit,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit..getModel(),
          builder: (context, state) {
            if(state.internetConnection){
             if(!state.progress){
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
                                           CrowdfundingCubit.to.state.searchProjects=[];
                                           VolunteerCubit.to.state.searchChange="";
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
                                           VolunteerCubit.to.state.searchProjects=[];
                                           VolunteerCubit.to.state.searchChange="";
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
                                           CharityCubit.to.state.searchProjects=[];
                                           CharityCubit.to.state.searchChange="";
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
                                 SizedBox(
                                   height: 300.w,
                                   child: SingleChildScrollView(
                                     physics: BouncingScrollPhysics(),
                                     scrollDirection: Axis.horizontal,
                                     child: Row(
                                       children: List.generate(
                                         state.crudFunding.length,
                                             (index) => Container(
                                           margin: EdgeInsets.only(left: 10.w),
                                           child: CrowdfundingCardWidget(
                                             projectModel:
                                             state.crudFunding[index],
                                             visible: true,
                                             onTap: () {
                                               NavigatorService.to.pushNamed(
                                                 ProjectDetailsPage.routeName,
                                                 arguments:
                                                 CrowdfundingDetailModel(
                                                   cubit: CrowdfundingCubit.to,
                                                   cardModel:
                                                   state.crudFunding[index],
                                                 ),
                                               );
                                             },
                                             onTapLike: () {
                                               homeCubit.changeLike(
                                                   state.crudFunding[index].id!);
                                             },
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
                                   top: 20.w,
                                 ),
                                 SizedBox(
                                   height: 300.w,
                                   child: SingleChildScrollView(
                                     physics: BouncingScrollPhysics(),
                                     scrollDirection: Axis.horizontal,
                                     child: Row(
                                       children: List.generate(
                                         state.volunteer.length,
                                             (index) => Container(
                                           margin: EdgeInsets.only(left: 10.w),
                                           child: VolunteerCardWidget(
                                             onTap: () {
                                               NavigatorService.to.pushNamed(
                                                 VolunteerDetailPage.routeName,
                                                 arguments: VolunteerDetailModel(
                                                   cubit: VolunteerCubit.to,
                                                   cardModel:
                                                   state.volunteer[index],
                                                 ),
                                               );
                                             },
                                             projectModel: state.volunteer[index],
                                             onTapLike: () {
                                               homeCubit.changeLike(
                                                   state.volunteer[index].id!);
                                             },
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
                                   left: 20.w,
                                   top: 10.w,
                                   bottom: 10.w,
                                 ),
                                 SizedBox(
                                   height: 300.w,
                                   child: SingleChildScrollView(
                                     physics: BouncingScrollPhysics(),
                                     scrollDirection: Axis.horizontal,
                                     child: Row(
                                       children: List.generate(
                                         state.charity.length,
                                             (index) {
                                           if(state.charity[index].requiredFund==null){
                                             return Container(
                                               margin: EdgeInsets.only(left: 10.w),
                                               child: CharityCardWidget(
                                                 projectModel: state.charity[index],
                                                 onTap: () {
                                                   NavigatorService.to.pushNamed(
                                                     CharityFullPage2.routName,
                                                     arguments:
                                                     state.charity[index]
                                                   );
                                                 },
                                                 onTapLike: () {
                                                   homeCubit.changeLike(
                                                       state.charity[index].id!);
                                                   homeCubit.getModel();
                                                 },
                                               ),
                                             );
                                           }else{
                                             return Container(
                                               margin: EdgeInsets.only(left: 10.w),
                                               child: CrowdfundingCardWidget(
                                                 projectModel: state.charity[index],
                                                 visible: false,
                                                 onTap: () {
                                                   NavigatorService.to.pushNamed(
                                                     ProjectDetailsPage.routeName,
                                                     arguments:
                                                     CrowdfundingDetailModel(
                                                       cubit: CrowdfundingCubit.to,
                                                       cardModel: state.charity[index],
                                                     ),
                                                   );
                                                 },
                                                 onTapLike: () {
                                                   homeCubit.changeLike(
                                                       state.charity[index].id!);
                                                   homeCubit.getModel();
                                                 },
                                               ),
                                             );
                                           }
                                             }
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
             }else {
               return Center(child: CircularProgressIndicator(),);
             }
            }else{
              return AppErrorWidget(
                  onTap: () async{
                    print(HiveService.to.getToken());
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
