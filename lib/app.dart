import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/notification_api_service.dart';
import 'package:najot/data/utils/app_route_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/language_page/language_page.dart';
import 'package:najot/ui/pages/splash_screen/splash_screen.dart';
import 'data/bloc/home_cubit/home_cubit.dart';
import 'data/bloc/language_cubit/language_cubit.dart';
import 'data/services/navigator_service.dart';
import 'data/services/root_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit.to.getModel();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) =>
          BlocListener<NotificationCubit, NotificationState>(
        bloc: NotificationCubit.to..getList(),
        listener: (context, state) {
          state.cardList.forEachIndexed((i, value) {
            NotificationApiService.showNotification(
              title: LocaleKeys.attention_hello_volunteer.tr(),
              body: LocaleKeys.you_go_to_help.tr(),
              payload: jsonEncode(value.toJson()),
              scheduledDate: DateTime.parse(value.modifiedAt!),
            );
          });
        },
        child: BlocListener<LanguageCubit, LanguageState>(
          bloc: LanguageCubit.to,
          listener: (context, state) {
            context.setLocale(state.locale);
          },
          child: MaterialApp(
            navigatorKey: NavigatorService.to.key,
            title: "Najot",
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
              )
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouteUtils.onGenerateRoute,
            supportedLocales: context.supportedLocales,
            // themeMode: ThemeCubit.to.state.themeMode,
            // theme: AppThemes.lightTheme(),
            // darkTheme: AppThemes.darkTheme(),
            localizationsDelegates: context.localizationDelegates,
            builder: BotToastInit(),
            home: const SplashScreen(),
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
