import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/organization_service.dart';
import 'package:najot/data/services/volunteer_service.dart';
part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {


  static OrganizationCubit get to => GetIt.I<OrganizationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<OrganizationCubit>(OrganizationCubit());
  }
  OrganizationCubit()
      : super(OrganizationState(
          checkBox: false,
          tobeVolunteer: Volunteer.tobeVolunteer,
        ));
  OrganizationService organizationService = OrganizationService();
  MainService mainService = MainService();

  Future load() async{
    var organizationModel=await organizationService.getModel();
    if(organizationModel != null){
      emit(state.copyWith(list: organizationModel.results));
    }

  }
  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future  onChangeSave(bool v) async {
    emit(state.copyWith(saveHelp: v));
  }
  Future findProject(int id) async{
      var tabProjects=await organizationService.getProjectModelById(id);
      if(tabProjects!=null){
        emit(state.copyWith(project: tabProjects));
      }

  }

  Future changeLike(int id) async{
    var changeLike= await mainService.changeLike(id);
    if(changeLike!=null){
    }
  }
}
