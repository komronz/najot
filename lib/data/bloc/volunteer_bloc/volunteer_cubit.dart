import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/volunteer_project_service.dart';

import '../../../ui/widgets/app_widgets.dart';
import '../../localization/locale_keys.g.dart';
import '../../model/volunteer_db_model.dart';
import '../../model/volunteer_donate_model.dart';
import '../../services/db_service.dart';
import '../../services/volunteer_service.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {

  static VolunteerCubit get to => GetIt.I<VolunteerCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<VolunteerCubit>(VolunteerCubit());
  }
  VolunteerCubit() : super(VolunteerState());
  VolunteerProjectService service= VolunteerProjectService();
  MainService mainService=MainService();
  var internetConnection;
  final DBService dbService=DBService();

  Future addDbVolunteer( DateTime dateTime,ProjectModel model)async{
    VolunteerDbModel volunteerDbModel=VolunteerDbModel();
    volunteerDbModel.id=model.id;
    volunteerDbModel.title=model.title;
    volunteerDbModel.helpType=model.helpType;
    volunteerDbModel.address=model.address;
    volunteerDbModel.modifiedAt=dateTime.toString();
    volunteerDbModel.deadLine=model.deadline;
    dbService.saveVolunteer(volunteerDbModel);
    load();
  }


  Future changeLike(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    if (internetConnection) {
      var changeLike = await mainService.changeLike(id);
      if (changeLike != null) {
        for (int j = 0; j < state.list.length; j++) {
          if (state.list[j].id == id) {
            state.list[j].isFavourite =
            !state.list[j].isFavourite!;
            break;
          }
        }
        for (int j = 0; j < state.searchProjects.length; j++) {
          if (state.searchProjects[j].id == id) {
            state.searchProjects[j].isFavourite =
            !state.searchProjects[j].isFavourite!;
            break;
          }
        }
        emit(
          state.copyWith(reload: !state.reload),
        );
      }
    } else {
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }
  }
  Future isContribution(int id) async{
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
     var isContribution = await service.contributionChange(id);
     if(isContribution !=null){
       load();
     }

  }

  Future searchChange(String v)async{
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(searchProgress: true));
    var getSearch = await service.getProjectsByName(v);
    if(getSearch != null){
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));


  }

  Future load() async {
    emit(state.copyWith(searchChange: ""));
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var volunteerModel = await service.getVolunteerModel();
    var isVolunteer = await mainService.getUserModel();
    if (volunteerModel != null) {
      emit(state.copyWith(
        list: volunteerModel.results!,
        checkBox: false,
      ));
    }
    if(isVolunteer != null){
        emit(state.copyWith(tobeVolunteer: isVolunteer.isVolunteer));
    }
  }

  void loading() {
    emit(state.copyWith());
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  void onChangeSave(bool v) {
    emit(state.copyWith(saveHelp: v));
  }
}
