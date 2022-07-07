import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/bloc/my_volunteering_cubit/my_volunteering_cubit.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/services/db_service.dart';
import 'package:najot/ui/pages/notification_page/widget/notification_api.dart';

import '../../localization/locale_keys.g.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  static NotificationCubit get to => GetIt.I<NotificationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<NotificationCubit>(NotificationCubit());


  }

  NotificationCubit() : super(NotificationState());
  final DBService dbService=DBService();
  final NotificationApi notificationApi=NotificationApi();


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
    print(volunteerDbModel.modifiedAt);
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
