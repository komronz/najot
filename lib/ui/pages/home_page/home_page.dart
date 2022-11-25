import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/services/notification_api_service.dart';
import 'package:najot/ui/pages/about_page/about_page.dart';
import 'package:najot/ui/pages/charity_history_page/charity_history_page.dart';
import 'package:najot/ui/pages/faq_page/faq_page.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_second.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_widget.dart';
import 'package:najot/ui/pages/main_page/main_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/notification_page/notification_page.dart';
import 'package:najot/ui/pages/notification_page/widget/attension_note.dart';
import 'package:najot/ui/pages/operator_page/operator_page.dart';
import 'package:najot/ui/pages/orders_page/orders_page.dart';
import 'package:najot/ui/pages/organization_page/organization_page.dart';
import 'package:najot/ui/pages/reg_volounteer/reg_volunteer.dart';
import 'package:najot/ui/pages/rules_page/rules_page.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/app_widgets.dart';
import '../my_project_and_announcements_pages/my_project_and_announcements_pages.dart';
import '../my_volunteering_page/my_volunteering_page.dart';
import '../my_volunteering_page/my_volunteering_widget/adding_project_page.dart';
import '../saved_page/saved_page.dart';
import '../volunteering_charity_history_page/volunteering_charity_history_page.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.appPageType});

  AppPageType appPageType;
  static const String routeName = "/homePage";
  static final GlobalKey<ScaffoldState> globalKey =
      GlobalKey<ScaffoldState>(debugLabel: "globalKey");

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    listenNotifications();
    super.initState();
  }

  void listenNotifications() =>
      NotificationApiService.onNotification.stream.listen(onClickNotification);

  Future onClickNotification(dynamic payload) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AttentionNote(
          con: context,
          model: VolunteerDbModel.fromJson(
            jsonDecode(payload!),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPageCubit, AppPageState>(
      bloc: AppPageCubit.to..load(widget.appPageType),
      builder: (context, state) {
        if (state.internetConnection) {
          return Scaffold(
            // backgroundColor: AppColorUtils.BACKGROUND,
            key: HomePage.globalKey,
            drawer: state.changeMenu == 1
                ? DrawerBody(
                    cubit: AppPageCubit.to,
                  )
                : DrawerBodySecond(cubit: AppPageCubit.to),
            body: buildBody(state),
          );
        } else {
          return AppErrorWidget(
            onTap: () async {
              AppWidgets.isLoading(true);
              await AppPageCubit.to.load(widget.appPageType);
              AppWidgets.isLoading(false);
            },
          );
        }
      },
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
        return AboutView();
      case AppPageType.USERPROFILE:
        return MyProfilePage();
      case AppPageType.VOLUNTEER:
        return RegVolunteer();
      case AppPageType.CHARITY:
        return CharityHistoryPage();
      case AppPageType.CHARITY_VOLUNTEER:
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
      case AppPageType.NOTIFICATION:
        return NotificationPage();
      default:
        return Container();
    }
  }
}
