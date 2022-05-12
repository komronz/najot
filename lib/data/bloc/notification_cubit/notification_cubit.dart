import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  static NotificationCubit get to => GetIt.I<NotificationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<NotificationCubit>(NotificationCubit());
  }

  NotificationCubit()
      : super(NotificationState(cardList: VolunteeringModel.list));
}
