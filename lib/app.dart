import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_route_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/intro_page/intro_page.dart';
import 'package:najot/ui/pages/language_page/language_page.dart';
import 'data/bloc/app_page_cubit/app_page_cubit.dart';
import 'data/bloc/language_cubit/language_cubit.dart';
import 'data/services/navigator_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context,widget) => BlocListener<LanguageCubit, LanguageState>(
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
           // home: LanguagePage(),
          home: HomePage(appPageType: AppPageType.MAIN),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          locale: context.locale,
        ),
      ),
    );
  }
}
