import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/bloc/language_cubit/language_cubit.dart';
import 'package:najot/data/bloc/theme_cubit/theme_cubit.dart';

import 'db_service.dart';

class DIService {
  static Future<void> init() async {
    // Services
    await DBService.init();

    // BloCs
    await LanguageCubit.init();
    await HomeCubit.init();
    await ThemeCubit.init();
    await AppPageCubit.init();

  }
}
