import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/bloc/my_volunteering_cubit/my_volunteering_cubit.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/services/db_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  static NotificationCubit get to => GetIt.I<NotificationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<NotificationCubit>(NotificationCubit()..getList());


  }

  NotificationCubit() : super(NotificationState());
  final DBService dbService=DBService();


  void isRead(bool vol) {
    emit(state.copyWith(isRead: vol));
  }
  Future delete(int index, VolunteerDbModel volunteerDbModel) async{
    await dbService.deleteVolunteerModel(volunteerDbModel);
    getList();
  }
  Future dateChange( int index, DateTime dateTime) async{
    VolunteerDbModel volunteerDbModel=VolunteerDbModel();
    List<VolunteerDbModel>? list = List.from(state.cardList);
    var box=list[index];
    volunteerDbModel.id=box.id;
    volunteerDbModel.modifiedAt=dateTime.toString();
    dbService.updateVolunteer(volunteerDbModel);
    getList();
  }
  Future getList()async{
    try{
    List<VolunteerDbModel>box = await dbService.getVolunteerList();
    emit(state.copyWith(list: box));
    }catch(e){

    }
  }
}
