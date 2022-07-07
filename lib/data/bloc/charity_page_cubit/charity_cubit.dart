import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/services/charity_saved_service.dart';
import 'package:najot/data/services/main_service.dart';

import '../../model/categories_model.dart';
import '../../model/project_model.dart';
import '../../model/volunteer_model.dart';
import '../../services/charity_service.dart';
import '../../utils/app_logger_util.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {


  static CharityCubit get to => GetIt.I<CharityCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<CharityCubit>(CharityCubit());
    await CharityCubit.to.load();
  }
  CharityCubit() : super(CharityState());
  CharityService charityService = CharityService();
  MainService mainService=MainService();

  Future load() async {
    var charityModel = await charityService.getCharityModel();
    var categories = await charityService.getCategoriesModel();
    var list= categories!.results![0];
    var tabProjects=await charityService.getProjectsById(list.children![0].id!);

    if (charityModel != null) {
      emit(state.copyWith(
          charityModel: charityModel,
          category: list.children,
          tabProjects: tabProjects
      ),

      );
      AppLoggerUtil.i(charityModel.count.toString());
    }
  }

  Future searchChange(String v)async{
    emit(state.copyWith(searchProgress: true));
    var getSearch = await charityService.getProjectsByName(v);
    if(getSearch != null){
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));


  }
  Future tabChange(int id) async{
    emit(state.copyWith(tabLoading: true));
    var tabProjects=await charityService.getProjectsById(id);
    if(tabProjects!=null){
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(tabProjects: tabProjects));
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
    var list = await CharitySavedService().getCharityList();
    emit(state.copyWith(saveHelp: v));
  }
  Future changeLike(int id) async{
    var changeLike= await mainService.changeLike(id);
    if(changeLike!=null){
      load();
    }
  }
}
