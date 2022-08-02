import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../../../ui/widgets/app_widgets.dart';

part 'kraud_fanding_state.dart';

class CrowdfundingCubit extends Cubit<CrowdfundingState> {
  static CrowdfundingCubit get to => GetIt.I<CrowdfundingCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<CrowdfundingCubit>(CrowdfundingCubit());
  }

  CrowdfundingCubit() : super(CrowdfundingState());
  CrowdfundingService crowdfundingService = CrowdfundingService();
  MainService mainService = MainService();
  List<RootProjectModel> rootList = [];
  var internetConnection;

  Future load() async {
    emit(state.copyWith(searchChange: ""));
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var crowdfundingModel = await crowdfundingService.getCrowdfundingModel();
    var categories = await crowdfundingService.getCategoriesModel();
    var list = categories!.results![0];
    var tabProjects =
        await crowdfundingService.getProjectsById(list.children![0].id!);
    print(list.children!.length);

    if (crowdfundingModel != null && tabProjects != null) {
      emit(state.copyWith(loading: false));
      emit(
        state.copyWith(
            crowdfundingModel: crowdfundingModel.results,
            category: list.children,
            tabProjects: tabProjects.results),
      );
      rootList.add(tabProjects);
      AppLoggerUtil.i(crowdfundingModel.count.toString());
    }
  }

  void reload() {
    emit(state.copyWith());
  }

  Future searchChange(String v) async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(searchProgress: true));
    var getSearch = await crowdfundingService.getProjectsByName(v);
    if (getSearch != null) {
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));
  }

  Future tabChange(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(tabLoading: true));
    var tabProjects = await crowdfundingService.getProjectsById(id);
    if (tabProjects != null) {
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(tabProjects: tabProjects.results));
      emit(state.copyWith(tabLoading: false));
    } else {
      emit(state.copyWith(tabProjects: []));
      emit(state.copyWith(tabLoading: false));
    }
  }

  Future crowdFundingChangeLike(int index, bool like) async {
    internetConnection = await mainService.checkInternetConnection();
    if (internetConnection) {
      List<ProjectModel> list = state.crowdfundingModel;
      list[index].isFavourite = !like;
      emit(state.copyWith(
        crowdfundingModel: list,
        reload: !state.reload,
      ));
    }
  }


  Future changeLike(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    if (internetConnection) {
      var changeLike = await mainService.changeLike(id);
      if (changeLike != null) {
        for (int j = 0; j < state.crowdfundingModel.length; j++) {
          if (state.crowdfundingModel[j].id == id) {
            state.crowdfundingModel[j].isFavourite =
                !state.crowdfundingModel[j].isFavourite!;
            break;
          }
        }
        for (int j = 0; j < state.tabProjects.length; j++) {
          if (state.tabProjects[j].id == id) {
            state.tabProjects[j].isFavourite =
                !state.tabProjects[j].isFavourite!;
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

  void detailTabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
