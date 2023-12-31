import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/volunteer_profile_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../../model/auth_model/user.dart';

part 'app_page_state.dart';

class AppPageCubit extends Cubit<AppPageState> {
  static AppPageCubit get to => GetIt.I<AppPageCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<AppPageCubit>(AppPageCubit());
  }

  AppPageCubit() : super(AppPageState());

  VolunteerProfileService service = VolunteerProfileService();

  Future load(AppPageType pageType) async {
    var internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var user = await service.getUser();
    if (user != null) {
      emit(
        state.copyWith(
          pageType: pageType,
          changeMenu: 1,
          user: user,
        ),
      );
    }
    emit(
      state.copyWith(
        pageType: pageType,
        changeMenu: 1,
      ),
    );
  }

  Future getUser() async {
    var internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var user = await service.getUser();
    if (user != null) {
      emit(state.copyWith(user: user));
    }
  }

  Future changePage({required AppPageType pageType}) async {
    emit(state.copyWith(pageType: pageType));
    AppLoggerUtil.i(pageType.toString());
  }

  Future changeMenu(int v) async {
    emit(state.copyWith(changeMenu: v));
  }

  void changeVolunteer(bool vol) {
    emit(state.copyWith(tobeVolunteer: vol));
  }
}
