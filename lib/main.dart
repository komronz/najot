import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:najot/app.dart';
import 'package:najot/data/bloc/app_bloc_observer.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );

      HydratedBlocOverrides.runZoned(
        () => runMainApp(),
        storage: storage,
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stack) {},
  );
}

Future runMainApp() async {
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  await RootService.init();

  runApp(
    EasyLocalization(
      path: 'assets/langs',
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("ru", "RU"),
        Locale("en", "EN"),
      ],
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const App(),
    ),
  );
}
