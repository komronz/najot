import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/volunteer_project_service.dart';

import '../../services/volunteer_service.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {

  static VolunteerCubit get to => GetIt.I<VolunteerCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<VolunteerCubit>(VolunteerCubit());
    await VolunteerCubit.to.load();
  }
  VolunteerCubit() : super(VolunteerState());
  VolunteerProjectService service= VolunteerProjectService();
  MainService mainService=MainService();

  Future changeLike(int id) async{
    var changeLike= await mainService.changeLike(id);
    if(changeLike!=null){
      load();
    }
  }

  Future searchChange(String v)async{
    emit(state.copyWith(searchProgress: true));
    var getSearch = await service.getProjectsByName(v);
    if(getSearch != null){
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));


  }

  Future load() async {

    var volunteerModel = await service.getVolunteerModel();

    if (volunteerModel != null) {

      emit(state.copyWith(
        list: volunteerModel.results!,
        checkBox: false,
        tobeVolunteer: Volunteer.tobeVolunteer,
      ));
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
