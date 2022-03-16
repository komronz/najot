import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/ui/pages/about_page/about_page.dart';
import 'package:najot/ui/pages/faq_page/faq_page.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_widget.dart';
import 'package:najot/ui/pages/main_page/main_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/rules_page/rules_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";
  AppPageCubit cubit = AppPageCubit();

  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: Scaffold(
        // backgroundColor: AppColorUtils.BACKGROUND,
        key: globalKey,
        drawer: DrawerBody(),
        body: BlocBuilder<AppPageCubit, AppPageState>(
          builder: (context, state) {
            return buildBody(state);
          },
        ),
      ),
    );
  }

  Widget buildBody(AppPageState state) {
    switch (state.pageType) {
      case AppPageType.MAIN:
        return MainPage();
      case AppPageType.FAQ:
        return FaqPage();
      case AppPageType.RULES:
        return RulesPage();
      case AppPageType.ABOUT:
        return AboutPage();
        case AppPageType.PROFILE:
        return MyProfilePage();
      default:
        return Container();
    }
  }
}
//BlocBuilder<HomeCubit, HomeState>(
//             builder: (context, state) {
//               return Container(
//                 color: AppColorUtils.BACKGROUND,
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 80,
//                       padding: EdgeInsets.all(20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             child: SvgPicture.asset(AppImageUtils.MENU),
//                             onTap: () {
//                               _globalKey.currentState?.openDrawer();
//                             },
//                           ),
//                           AppWidgets.textLocale(
//                             text: LocaleKeys.main,
//                             fontSize: 26,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           SvgPicture.asset(AppImageUtils.NOTIFICATION)
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CarouselSliderWidget(sliderList: state.sliderList),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 AppWidgets.textLocale(
//                                   text: "Kategoriyalar",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 22.sp,
//                                 ).paddingOnly(left: 20.w),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 20, top: 10, bottom: 20, left: 20),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       IconAndName(
//                                         text: 'Kraudfanding',
//                                         icon: AppImageUtils.KRAUDFANDING,
//                                         fontWeight: FontWeight.w600,
//                                         fontsize: 14,
//                                         color: AppColorUtils.KRAUDFANDING,
//                                         voidCallback: () {},
//                                       ),
//                                       IconAndName(
//                                         text: 'Volontyorlik',
//                                         icon: AppImageUtils.VOLONTYOR,
//                                         fontWeight: FontWeight.w600,
//                                         fontsize: 14,
//                                         color: AppColorUtils.VOLONTYOR,
//                                         voidCallback: () {},
//                                       ),
//                                       IconAndName(
//                                         text: 'Xayriya',
//                                         icon: AppImageUtils.CHARITY,
//                                         fontWeight: FontWeight.w600,
//                                         fontsize: 14,
//                                         color: AppColorUtils.CHARITY,
//                                         voidCallback: () {},
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 AppWidgets.textLocale(
//                                   text: "Kraudfanding",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 22.sp,
//                                 ).paddingOnly(left: 20.w),
//                                 SizedBox(
//                                   height: 10.h,
//                                 ),
//                                 SizedBox(
//                                   height: 300.h,
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Row(
//                                       children: List.generate(
//                                         state.sliderList.length,
//                                         (index) => Container(
//                                           margin: EdgeInsets.only(left: 10.w),
//                                           child: KraudfandingCardWidget(
//                                             sliderModel:
//                                                 state.sliderList[index],
//                                             visible: true,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 AppWidgets.textLocale(
//                                   text: "Volontyorlik",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 22.sp,
//                                 ).paddingOnly(
//                                   left: 20.w,
//                                   top: 20.h,
//                                 ),
//                                 SizedBox(
//                                   height: 300.h,
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Row(
//                                       children: List.generate(
//                                         state.sliderList.length,
//                                         (index) => Container(
//                                           margin: EdgeInsets.only(left: 10.w),
//                                           child: VolunteerCardWidget(
//                                             sliderModel:
//                                                 state.sliderList[index],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 AppWidgets.textLocale(
//                                   text: "Xayriya",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 22.sp,
//                                 ).paddingOnly(
//                                     left: 20.w, top: 10.h, bottom: 10.h),
//                                 SizedBox(
//                                   height: 300.h,
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Row(
//                                       children: List.generate(
//                                         state.sliderList.length,
//                                         (index) => Container(
//                                           margin: EdgeInsets.only(left: 10.w),
//                                           child: KraudfandingCardWidget(
//                                             sliderModel:
//                                                 state.sliderList[index],
//                                             visible: false,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
