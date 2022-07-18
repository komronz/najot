import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/volunteer_project_service.dart';

import '../../../ui/widgets/app_widgets.dart';
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

  Future changeLike(int id) async{
    internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
      var changeLike= await mainService.changeLike(id);
      if(changeLike!=null){
        load();
      }
    }else{
      AppWidgets.showText(text: "Internet bilan aloqa yo'q!");
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
        tobeVolunteer: Volunteer.tobeVolunteer,
      ));
    }
    if(isVolunteer != null){

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
