import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/model/volunteering_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  static NotificationCubit get to => GetIt.I<NotificationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<NotificationCubit>(NotificationCubit());
  }

  NotificationCubit()
      : super(NotificationState(cardList: VolunteeringModel.list));

  void isRead(bool vol) {
    emit(state.copyWith(isRead: vol));
  }
  Future delete(int index) async{
    List<VolunteeringModel>? list = List.from(state.cardList);
    for (var i = 0; i < list.length; i++){
      if(list[i] == index) {
      }
    }
    list.removeAt(index);
    emit(state.copyWith(list:list));
  }

  void dateChange(DateTime dateTime, int index) {
    List<VolunteeringModel>? list = List.from(state.cardList);
    list[index].createdDate = dateTime.toString();
    // list[index].completedDate = dateTime.toString();
    emit(state.copyWith(list:list));
  }
}
