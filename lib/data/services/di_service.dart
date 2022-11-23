import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/bloc/language_cubit/language_cubit.dart';
import 'package:najot/data/bloc/my_volunteering_cubit/my_volunteering_cubit.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/data/bloc/theme_cubit/theme_cubit.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/services/notification_api_service.dart';

import 'db_service.dart';

class DIService {
  static Future<void> init() async {
    // Services
    await DBService.init();
    await NotificationApiService.init(initScheduled: true);

    // BloCs
    await LanguageCubit.init();
    await AppPageCubit.init();
    await HomeCubit.init();
    await ThemeCubit.init();
    await CrowdfundingCubit.init();
    await CharityCubit.init();
    await VolunteerCubit.init();
    await OrganizationCubit.init();
    await NotificationCubit.init();
    await MyVolunteeringCubit.init();
  }
}
