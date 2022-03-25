import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';
import 'package:najot/ui/pages/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/charity_page/charity_page.dart';
import 'package:najot/ui/pages/counter_page/counter_page.dart';
import 'package:najot/ui/pages/home_page/about_announcement_page/about_announcement_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/home_page/volunteer_page/volunteer_page.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';
import 'package:najot/ui/pages/login_page/login_page.dart';
import 'package:najot/ui/pages/reg_page/reg_page.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/verification_page/verification_page.dart';
import '../../ui/pages/charity_full_page/charity_full_page.dart';
import '../../ui/pages/kraudfanding_page_main/kraudfanding_page.dart';
import '../../ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import '../../ui/pages/my_profil_page/my_profile_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/number_update_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_degree_page.dart';
import '../../ui/pages/my_profil_page/my_profile_pages/user_update_page.dart';
import '../../ui/pages/sms_with_operator_page/sms_with_operator_page.dart';
import '../model/card_model.dart';
import '../model/charity_model.dart';

class AppRouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoadingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingPage(),
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
          builder: (context) => RegPage(),
        );
      case VerificationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VerificationPage(),
        );
      case HomePage.routeName:
        return CupertinoPageRoute(
          builder: (context) => HomePage(),
        );
      case CharityPage.routeName:
        return MaterialPageRoute(
          builder: (context) => CharityPage(),
        );
      case VolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerPage(),
        );
      case CharityFullPage.routName:
        return MaterialPageRoute(
          builder: (context) => CharityFullPage(
            model: settings.arguments as CharityModel,
          ),
        );
      case ProjectDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ProjectDetailsPage(
            cardModel: settings.arguments as CardModel,
          ),
        );
      case KraudFandingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => KraudFandingPage(),
        );
      case AboutAnnouncementPage.routeName:
        return MaterialPageRoute(
          builder: (context) => AboutAnnouncementPage(),
        );
      case VolunteerPage.routeName:
        return MaterialPageRoute(
          builder: (context) => VolunteerPage(),
        );
      case CharityPage.routeName:
        return MaterialPageRoute(
          builder: (context) => CharityPage(),
        );
      case MyProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyProfilePage(),
        );
      case UserUpdatePage.routeName:
        return MaterialPageRoute(
          builder: (context) => UserUpdatePage(bloc: settings.arguments as MyProfileUpdateBloc),
        );
      case NumberUpdatePage.routeName:
        return MaterialPageRoute(
          builder: (context) => NumberUpdatePage(),
        );
          case UserDegreePage.routeName:
        return MaterialPageRoute(
          builder: (context) => UserDegreePage(),
        );
      case SmsWithOperatorPage.routeName:
        return MaterialPageRoute(
          builder: (context) => SmsWithOperatorPage(),
        );
      case ImgView.routeName:
        return MaterialPageRoute(
          builder: (context) => ImgView(imgPath: settings.arguments as String),
        );
    }
  }
}
