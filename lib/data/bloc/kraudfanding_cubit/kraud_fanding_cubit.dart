import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

part 'kraud_fanding_state.dart';

class CrowdfundingCubit extends Cubit<CrowdfundingState> {

  static CrowdfundingCubit get to => GetIt.I<CrowdfundingCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<CrowdfundingCubit>(CrowdfundingCubit());
    await CrowdfundingCubit.to.load();
  }
  CrowdfundingCubit() : super(CrowdfundingState());
  CrowdfundingService crowdfundingService = CrowdfundingService();
  MainService mainService=MainService();
  List<RootProjectModel> rootList= [];

  Future load() async {
    var crowdfundingModel = await crowdfundingService.getCrowdfundingModel();
    var categories = await crowdfundingService.getCategoriesModel();
    var list= categories!.results![0];
    var tabProjects=await crowdfundingService.getProjectsById(list.children![0].id!);


    if (crowdfundingModel != null&&tabProjects!= null ) {
      print(crowdfundingModel.results![0].isFavourite);
      emit(state.copyWith(loading: false));
      emit(state.copyWith(
        crowdfundingModel: crowdfundingModel.results,
        category: list.children,
        tabProjects: tabProjects.results
      ),
      );
      rootList.add(tabProjects);
      AppLoggerUtil.i(crowdfundingModel.count.toString());
    }
  }

  Future SearchChange(String v)async{
    emit(state.copyWith(searchProgress: true));
    var getSearch = await crowdfundingService.getProjectsByName(v);
    if(getSearch != null){
      emit(state.copyWith(searchProjects: getSearch.results));
    }
    emit(state.copyWith(searchChange: v));
    emit(state.copyWith(searchProgress: false));


  }
  Future tabChange(int id) async{
    emit(state.copyWith(tabLoading: true));
    var tabProjects=await crowdfundingService.getProjectsById(id);
      if(tabProjects!=null){
        await Future.delayed(Duration(seconds: 1));
        emit(state.copyWith(tabProjects: tabProjects.results));
        emit(state.copyWith(tabLoading: false));
      }
  }
  Future changeLike(int id) async{
    var changeLike= await mainService.changeLike(id);
    if(changeLike!=null){
      load();
    }
  }
  void detailTabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}


