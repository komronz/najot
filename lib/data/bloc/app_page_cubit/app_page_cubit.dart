import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../../services/volunteer_service.dart';

part 'app_page_state.dart';

class AppPageCubit extends Cubit<AppPageState> {
  static AppPageCubit get to => GetIt.I<AppPageCubit>();

  static Future init() async {
    GetIt.I.registerSingleton<AppPageCubit>(AppPageCubit());
  }

  AppPageCubit() : super(const AppPageState());

  void load(AppPageType pageType) {
    emit(
      state.copyWith(
        pageType: pageType,
        changeMenu: 1,
        tobeVolunteer: Volunteer.tobeVolunteer,
      ),
    );
  }

  Future changePage({
    required AppPageType pageType,
  }) async {
    emit(
      state.copyWith(
        pageType: pageType,
      ),
    );
    AppLoggerUtil.i(pageType.toString());
  }

  Future changeMenu(int v) async {
    emit(state.copyWith(changeMenu: v));
  }

  void changeVolunteer(bool vol) {
    emit(state.copyWith(tobeVolunteer: vol));
  }
}
