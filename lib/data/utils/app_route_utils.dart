import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/ui/pages/about_page/about_page.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/counter_page/counter_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/edit_volunteer_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/choose_lang.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_update_volunteer_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/user_update_volunteer_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/intro_page/intro_page.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/product_datail_page/product_detail_page.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';
import 'package:najot/ui/pages/login_page/login_page.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_page.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_widget/adding_project_page.dart';
import 'package:najot/ui/pages/reg_page/reg_page.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/verification_page/verification_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_help_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_page.dart';
import '../../ui/pages/charity_page/charity_full_page/charity_full_page2.dart';
import '../../ui/pages/charity_page/widgets/charity_help_widget.dart';
import '../../ui/pages/kraudfanding_page_main/kraudfanding_page.dart';
import '../../ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import '../../ui/pages/my_products_page/my_products_page.dart';
import '../../ui/pages/my_profil_page/my_profile_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/number_update_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_degree_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_update_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_charity_item_project_full_widget/my_charity_item_full_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_project_full_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_support_list_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_crowdfunding_project/my_crowdfunding_about_widget.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_crowdfunding_project/my_crowdfunding_support_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_project_and_announcements_pages.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/about_my_volunteering_project_page.dart';
import '../../ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/my_volunteering_support_list_page.dart';
import '../../ui/pages/notification_page/notification_page.dart';
import '../../ui/pages/notification_page/widget/attension_note.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_charity_item_widget.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_help_widget.dart';
import '../../ui/pages/organization_page/organization_item_detail_page/organization_item_detail_page.dart';
import '../../ui/pages/volunteering_charity_history_page/volunteering_charity_history_page.dart';
import '../../ui/pages/volunteering_charity_history_page/widgets/volunteering_charity_full_page.dart';
import '../model/charity_model.dart';
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
          builder: (context) => IntroPage(),
        );
      case ChooseLangPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ChooseLangPage(),
        );
      case CounterPage.routeName:
        return CupertinoPageRoute(
          builder: (context) => CounterPage(),
        );
      case AuthPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AuthPage(),
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
            cardModel: settings.arguments as ProjectModel,
          ),
        );
      case CharityFullPage2.routName:
        return MaterialPageRoute(
          builder: (context) => CharityFullPage2(
            helpModel: settings.arguments as CharityFullModel,
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
      case OrganizationCharityItemWidget.routName:
        return MaterialPageRoute(
          builder: (context) => OrganizationCharityItemWidget(
            helpModel: settings.arguments as OrganizationCharityItemModel,
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
          builder: (context) => CrowdfundingPage(
          ),
        );
      case VolunteerDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerDetailPage(
            model: settings.arguments as VolunteerDetailModel,
          ),
        );
      case VolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerPage(
          ),
        );
      case CharityPage.routeName:
        return MaterialPageRoute(
          builder: (context) => CharityPage(
          ),
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
      case UserUpdateVolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => UserUpdateVolunteerPage(),
        );
      case NumberUpdatePage.routeName:
        return MaterialPageRoute(
          builder: (context) => NumberUpdatePage(),
        );
      case EditVolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => EditVolunteerPage(),
        );
      case NumberUpdateVolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => NumberUpdateVolunteerPage(),
        );
      case UserDegreePage.routeName:
        return MaterialPageRoute(
          builder: (context) => UserDegreePage(),
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
            cardModel: settings.arguments as CharityModel,
          ),
        );
      case MyCharitySupportListPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCharitySupportListPage(
            list: settings.arguments as List<CharityModel>,
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
      case MyVolunteeringSupportListPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyVolunteeringSupportListPage(
            list: settings.arguments as List<VolunteeringModel>,
          ),
        );
      case MyProductsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyProductsPage(),
        );
      case NotificationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => NotificationPage(),
        );
      case VolunteeringCharityHistoryPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteeringCharityHistoryPage(),
        );
      case AttentionNote.routeName:
        return MaterialPageRoute(
          builder: (context) => AttentionNote(
            model: settings.arguments as VolunteeringModel,
          ),
        );
      case MyCrowdfundingAboutWidget.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCrowdfundingAboutWidget(
            model: settings.arguments as ProjectModel,
          ),
        );
      case VolunteeringCharityFullPage.routName:
        return MaterialPageRoute(
          builder: (context) => VolunteeringCharityFullPage(
            model: settings.arguments as CharityModel,
          ),
        );
      case MyCrowdfundingSupportPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyCrowdfundingSupportPage(
            list: settings.arguments as List<KraufandingModel>,
          ),
        );
      case AboutPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AboutPage(),
        );

    }
    return null;
  }
}
