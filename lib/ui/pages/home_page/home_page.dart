import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/ui/pages/about_page/about_page.dart';
import 'package:najot/ui/pages/charity_history_page/charity_history_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/edit_volunteer_page.dart';
import 'package:najot/ui/pages/faq_page/faq_page.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_second.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_widget.dart';
import 'package:najot/ui/pages/main_page/main_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/operator_page/operator_page.dart';
import 'package:najot/ui/pages/orders_page/orders_page.dart';
import 'package:najot/ui/pages/organization_page/organization_page.dart';
import 'package:najot/ui/pages/reg_volounteer/reg_volunteer.dart';
import 'package:najot/ui/pages/rules_page/rules_page.dart';

import '../my_project_and_announcements_pages/my_project_and_announcements_pages.dart';
import '../my_volunteering_page/my_volunteering_page.dart';
import '../my_volunteering_page/my_volunteering_widget/adding_project_page.dart';
import '../saved_page/saved_page.dart';
import '../volunteering_charity_history_page/volunteering_charity_history_page.dart';

class HomePage extends StatelessWidget {
  HomePage({ required this.appPageType});

  AppPageType appPageType;
  static const String routeName = "/homePage";
  AppPageCubit cubit = AppPageCubit();

  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit..load(appPageType),
      child: BlocBuilder<AppPageCubit, AppPageState>(
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: AppColorUtils.BACKGROUND,
            key: globalKey,
            drawer: state.changeMenu==1
                ? DrawerBody(state: state)
                : DrawerBodySecond(state: state),
            body: buildBody(state)
          );
        },
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
        return EditVolunteerPage();
      case AppPageType.USERPROFILE:
        return MyProfilePage();
      case AppPageType.VOLUNTEER:
        return RegVolunteer();
      case AppPageType.CHARITY:
        return VolunteeringCharityHistoryPage();
      case AppPageType.OPERATOR:
        return OperatorPage();
      case AppPageType.ORDERS:
        return OrdersPage();
      case AppPageType.SAVED:
        return SavedPage();
      case AppPageType.ORGANIZATIONS:
        return OrganizationPage();
      case AppPageType.PROJECT:
        return MyProjectAndAnnouncementsPages();
      case AppPageType.VOLUNTEERING:
        return MyVolunteeringPage();
      case AppPageType.ADD_PROJECT:
        return AddingProjectPage();
      default:
        return Container();
    }
  }
}
