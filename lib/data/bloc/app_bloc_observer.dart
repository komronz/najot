import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/utils/app_logger_utils.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLoggerUtils.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLoggerUtils.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    AppLoggerUtils.i('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }
}
