import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/utils/app_logger_util.dart';

part 'app_page_state.dart';

class AppPageCubit extends Cubit<AppPageState> {
  AppPageCubit() : super(AppPageState(pageType: AppPageType.MAIN));

  Future changePage({required AppPageType pageType}) async {
    emit(state.copyWith(pageType: pageType));
    AppLoggerUtil.i(pageType.toString());
  }
}
