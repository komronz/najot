import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/utils/app_route_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/intro_page/intro_page.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_project_and_announcements_pages.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_page.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/volunteering_charity_history_page.dart';

import 'data/bloc/language_cubit/language_cubit.dart';
import 'data/services/navigator_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => BlocListener<LanguageCubit, LanguageState>(
        bloc: LanguageCubit.to,
        listener: (context, state) {
          context.setLocale(state.locale);
        },
        child: MaterialApp(
          navigatorKey: NavigatorService.to.key,
          title: "Najot",
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouteUtils.onGenerateRoute,
          supportedLocales: context.supportedLocales,
          // themeMode: ThemeCubit.to.state.themeMode,
          // theme: AppThemes.lightTheme(),
          // darkTheme: AppThemes.darkTheme(),
          localizationsDelegates: context.localizationDelegates,
          builder: BotToastInit(),
          home: IntroPage(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          locale: context.locale,
        ),
      ),
    );
  }
}
