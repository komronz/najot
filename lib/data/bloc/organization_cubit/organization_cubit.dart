import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/organization_service.dart';

import '../../../ui/widgets/app_widgets.dart';
import '../../localization/locale_keys.g.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  static OrganizationCubit get to => GetIt.I<OrganizationCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<OrganizationCubit>(OrganizationCubit());
  }

  OrganizationCubit()
      : super(OrganizationState(
          checkBox: false,
        ));
  OrganizationService organizationService = OrganizationService();
  MainService mainService = MainService();
  var internetConnection;

  Future load() async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var organizationModel = await organizationService.getModel();
    if (organizationModel != null) {
      emit(state.copyWith(list: organizationModel.results));
    }
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future onChangeSave(bool v) async {
    emit(state.copyWith(saveHelp: v));
  }
  Future findProject(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(project: RootProjectModel()));
    var tabProjects = await organizationService.getProjectModelById(id);
    if (tabProjects != null) {
      emit(state.copyWith(project: tabProjects));
    }
  }

  Future changeLike(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    if (internetConnection) {
      var changeLike = await mainService.changeLike(id);
      if (changeLike != null) {
        for (int j = 0; j < state.project!.results!.length; j++) {
          if (state.project!.results![j].id == id) {
            state.project!.results![j].isFavourite =
                !state.project!.results![j].isFavourite!;
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
}
