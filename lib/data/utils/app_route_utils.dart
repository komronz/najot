import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/ui/pages/about_page/about_page.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/counter_page/counter_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/crowdfunding_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/product_datail_page/product_detail_page.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/intro_page/intro_page.dart';
import 'package:najot/ui/pages/language_page/choose_lang.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';
import 'package:najot/ui/pages/login_page/login_page.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_page.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_widget/adding_project_page.dart';
import 'package:najot/ui/pages/operator_page/operator_page.dart';
import 'package:najot/ui/pages/organization_page/organization_item_detail_page/organization_item_widget2.dart';
import 'package:najot/ui/pages/reg_page/reg_page.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/verification_page/verification_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_help_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_page.dart';
import '../../ui/pages/charity_page/charity_full_page/charity_full_page2.dart';
import '../../ui/pages/charity_page/widgets/charity_help_widget.dart';
import '../../ui/pages/language_page/language_page.dart';
import '../../ui/pages/my_profil_page/my_profile_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/number_update_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_degree_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_update_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/ArgumentsClassInTesterPagesInProductsAnnouncements.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_charity_item_project_full_widget/my_charity_item_full_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_project_full_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_crowdfunding_project/my_crowdfunding_about_widget.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_project_and_announcements_pages.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/about_my_volunteering_project_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/tester_pages_in_progects_announcements.dart';
import '../../ui/pages/notification_page/notification_page.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_item_widget.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_help_widget.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_item_detail_page.dart';
import '../../ui/pages/volunteering_charity_history_page/volunteering_charity_history_page.dart';
import '../model/project_model.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoadingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingPage(),
        );
      case IntroPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const IntroPage(),
        );
      case ChooseLangPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChooseLangPage(),
        );
      case CounterPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => CounterPage(),
        );
      case AuthPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RegPage.routeName:
        return MaterialPageRoute(
          builder: (context) => RegPage(
            loginBloc: settings.arguments as LoginBloc,
          ),
        );
        case LanguagePage.routeName:
        return MaterialPageRoute(
          builder: (context) => LanguagePage(
          ),
        );
      case VerificationPage.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              VerificationPage(loginBloc: settings.arguments as LoginBloc),
        );
      case HomePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => HomePage(
            appPageType: settings.arguments as AppPageType,
          ),
        );

      case CharityFullPage.routName:
        return MaterialPageRoute(
          builder: (context) => CharityFullPage(
            model: settings.arguments as ProjectModel,
          ),
        );
      case CharityFullPage2.routName:
        return MaterialPageRoute(
          builder: (context) => CharityFullPage2(
            helpModel: settings.arguments as ProjectModel,
          ),
        );
      case CharityHelpWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => CharityHelpWidget(
            helpModel: settings.arguments as CharityHelpModel,
          ),
        );
      case ProjectDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ProjectDetailsPage(
            model: settings.arguments as CrowdfundingDetailModel,
          ),
        );

      case OrganizationItemDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => OrganizationItemDetailPage(
            model: settings.arguments as OrganizationItemDetailPageModel,
          ),
        );
      case OrganizationItemWidget.routName:
        return MaterialPageRoute(
          builder: (context) => OrganizationItemWidget(
            model: settings.arguments as OrganizationItemModel,
          ),
        );
      case ProductDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            model: settings.arguments as ProductDetailModel,
          ),
        );
      case OrganizationHelpWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => OrganizationHelpWidget(
            helpModel: settings.arguments as OrganizationHelpModel,
          ),
        );
      case CrowdfundingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => CrowdfundingPage(),
        );
      case VolunteerDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerDetailPage(
            model: settings.arguments as VolunteerDetailModel,
          ),
        );
      case OrganizationItemWidget2.routName:
        return MaterialPageRoute(
          builder: (context) => OrganizationItemWidget2(
            model: settings.arguments as OrganizationItemModel,
          ),
        );
      case VolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerPage(),
        );
      case CharityPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CharityPage(),
        );
      case MyProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyProfilePage(),
        );
      case UserUpdatePage.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              UserUpdatePage(bloc: settings.arguments as MyProfileUpdateBloc),
        );
      case NumberUpdatePage.routeName:
        return MaterialPageRoute(
          builder: (context) => NumberUpdatePage(
            bloc: settings.arguments as MyProfileUpdateBloc,
          ),
        );
      case UserDegreePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const UserDegreePage(),
        );

      case ImgView.routeName:
        return MaterialPageRoute(
          builder: (context) => ImgView(imgPath: settings.arguments as String),
        );
      case MyVolunteeringPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyVolunteeringPage(),
        );
      case AddingProjectPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AddingProjectPage(),
        );
      case MyProjectAndAnnouncementsPages.routeName:
        return MaterialPageRoute(
          builder: (context) => MyProjectAndAnnouncementsPages(),
        );
      case VolunteerHelpWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerHelpWidget(
            volunteerHelpModel: settings.arguments as VolunteerHelpModel,
          ),
        );
      case MyCharityProjectFullPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCharityProjectFullPage(
            cardModel: settings.arguments as ProjectModel,
          ),
        );
      case MyCharityItemFullPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCharityItemFullPage(
            cardModel: settings.arguments as ProjectModel,
          ),
        );
      case AboutMyVolunteeringItemProjectWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => AboutMyVolunteeringItemProjectWidget(
            model: settings.arguments as ProjectModel,
          ),
        );
      case NotificationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => NotificationPage(),
        );
      case VolunteeringCharityHistoryPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const VolunteeringCharityHistoryPage(),
        );
      case MyCrowdfundingAboutWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCrowdfundingAboutWidget(
            model: settings.arguments as ProjectModel,
          ),
        );
      case AboutView.routeName:
        return MaterialPageRoute(
          builder: (context) => const AboutView(),
        );
      case OperatorPage.routeName:
        return MaterialPageRoute(
          builder: (context) => OperatorPage(),
        );
      case 'test_route':
        return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as ArgumentsInTesterPage;
            return TesterPagesInProjectsAnnouncements(
              helpModel: args.projectModel,
              screen_number: args.number,
            );
          }
        );
    }
    return null;
  }
}
