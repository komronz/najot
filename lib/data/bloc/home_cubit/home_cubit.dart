import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static HomeCubit get to => GetIt.I<HomeCubit>();
  MainService mainService = MainService();

  static Future init() async {
    GetIt.instance..registerSingleton<HomeCubit>(HomeCubit());
    await GetIt.I<HomeCubit>();
  }

  HomeCubit() : super(HomeState());
  var internetConnection;

  Future getModel() async {
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var mainModel = await mainService.getModel();
    if (mainModel != null) {
      emit(state.copyWith(
        categories: mainModel.categories,
        crudFunding: mainModel.crowdfunding,
        volunteer: mainModel.volunteering,
        charity: mainModel.charity,
        slider: mainModel.slider,
      ));
    } else {}
  }

  Future tokenUpdate() async {
    if (RootService.hiveService.getToken() != null) {
      var createdAt = DateTime.parse(RootService.hiveService.getToken()!.exp!);
      var currentDay = DateTime.now().add(Duration(days: 1));
      if (createdAt.year == currentDay.year &&
          createdAt.month == currentDay.month &&
          createdAt.day < currentDay.day) {
        var tokenModel = await mainService.tokenUpdate();
        if (tokenModel != null) {
          RootService.hiveService.setToken(tokenModel);
        } else {
          AppLoggerUtil.e("token error");
        }
      }
    }
  }

  void crowdFundingChangeLike(int index, bool like) {
    List<ProjectModel> list = state.crudFunding;
    list[index].isFavourite = !like;
    emit(state.copyWith(
      crudFunding: list,
      reload: !state.reload,
    ));
  }
  void volunteerChangeLike(int index, bool like) {
    List<ProjectModel> list = state.volunteer;
    list[index].isFavourite = !like;
    emit(state.copyWith(
      volunteer: list,
      reload: !state.reload,
    ));
  }
  void charityChangeLike(int index, bool like) {
    List<ProjectModel> list = state.charity;
    list[index].isFavourite = !like;
    emit(state.copyWith(
      charity: list,
      reload: !state.reload,
    ));
  }

  void reload(){
    emit(state.copyWith(reload: !state.reload));
  }
  Future changeLike(int id) async {
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    var changeLike = await mainService.changeLike(id);
    if (changeLike != null) {}
  }
}
