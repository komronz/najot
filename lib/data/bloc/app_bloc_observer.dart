import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/utils/app_logger_util.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLoggerUtil.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLoggerUtil.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    AppLoggerUtil.i('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }
}
