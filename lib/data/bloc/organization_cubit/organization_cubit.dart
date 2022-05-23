import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/data/model/projects_model.dart';
import 'package:najot/data/services/organization_service.dart';
import 'package:najot/data/services/projects_model_service.dart';
import 'package:najot/data/services/volunteer_service.dart';
part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit()
      : super(OrganizationState(
          checkBox: false,
          tobeVolunteer: Volunteer.tobeVolunteer,
        ));
  OrganizationService organizationService = OrganizationService();
  ProjectsModelService projectsModelService = ProjectsModelService();

  Future load() async{
    var organizationModel=await organizationService.getModel();
    emit(state.copyWith(list: organizationModel!.results));
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future  onChangeSave(bool v) async {
    emit(state.copyWith(saveHelp: v));
  }
  Future loadProduct() async{
    var productsModel = await projectsModelService.getProductModel();
    emit(state.copyWith(listProject: productsModel!.results));
  }
}
