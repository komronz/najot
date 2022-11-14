import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/main_service.dart';
import '../../../ui/widgets/app_widgets.dart';
import '../../localization/locale_keys.g.dart';
import '../../model/categories_model.dart';
import '../../model/project_model.dart';
import '../../model/volunteer_db_model.dart';
import '../../model/volunteer_model.dart';
import '../../services/charity_service.dart';
import '../../services/db_service.dart';
import '../../utils/app_logger_util.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  static CharityCubit get to => GetIt.I<CharityCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<CharityCubit>(CharityCubit());
  }

  CharityCubit() : super(CharityState());
  CharityService charityService = CharityService();
  MainService mainService = MainService();

  var internetConnection;
  final DBService dbService = DBService();

  Future addDbVolunteer(DateTime dateTime, ProjectModel model) async {
    VolunteerDbModel volunteerDbModel = VolunteerDbModel();
    volunteerDbModel.id = model.id;
    volunteerDbModel.title = model.title;
    volunteerDbModel.helpType = model.helpType;
    volunteerDbModel.address = model.address;
    volunteerDbModel.modifiedAt = dateTime.toString();
    volunteerDbModel.deadLine = model.deadline;
    dbService.saveVolunteer(volunteerDbModel);
  }

  Future isContribution(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var isContribution = await charityService.contributionChange(id);
    if (isContribution != null) {}
  }

  Future load() async {
    emit(state.copyWith(searchChange: ""));
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var isVolunteer = await mainService.getUserModel();
    var charityModel = await charityService.getCharityModel();
    var categories = await charityService.getCategoriesModel();
    var list = categories!.results![0];
    var tabProjects =
        await charityService.getProjectsById(list.children![0].id!);

    if (charityModel != null) {
      emit(
        state.copyWith(
          charityModel: charityModel,
          category: list.children,
          tabProjects: tabProjects != null ? tabProjects.results : [],
        ),
      );
      AppLoggerUtil.i(charityModel.count.toString());
    }

    if (isVolunteer != null) {
      emit(state.copyWith(tobeVolunteer: isVolunteer.isVolunteer));
    }
  }

  Future searchChange(String v) async {
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(searchProgress: true));
    var getSearch = await charityService.getProjectsByName(v);
    if (getSearch != null) {
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));
  }


  Future tabChange(int id) async {
    emit(state.copyWith(tabProjects: []));
    bool internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(tabLoading: true));
    var tabProjects = await charityService.getProjectsById(id);
    if (tabProjects != null) {
      emit(state.copyWith(tabProjects: tabProjects.results));
      emit(state.copyWith(tabLoading: false));
    }
  }

  void loading() {
    emit(state.copyWith());
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future onChangeSave(bool v) async {
    emit(state.copyWith(saveHelp: v));
  }

  Future changeLike(int id) async {
    internetConnection = await mainService.checkInternetConnection();
    if (internetConnection) {
      var changeLike = await mainService.changeLike(id);
      if (changeLike != null) {
        for (int j = 0; j < state.charityModel!.results!.length; j++) {
          if (state.charityModel!.results![j].id == id) {
            state.charityModel!.results![j].isFavourite =
                !state.charityModel!.results![j].isFavourite!;
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
}
