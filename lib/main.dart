import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:najot/app.dart';
import 'package:najot/data/bloc/app_bloc_observer.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:path_provider/path_provider.dart';

class MyHttpOverrides extends HttpOverrides {
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  HttpOverrides.global = new MyHttpOverrides();
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );
      HydratedBloc.storage = storage;
      Bloc.observer = AppBlocObserver();
      runMainApp();
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
        // Qirg'iziton lokali, krill o'zbekcha uchun ishlatildi
        Locale("ky", "KG"),
        Locale("ru", "RU"),
      ],
      fallbackLocale: Locale('uz', 'UZ'),
      child: App(),
    ),
  );
}
