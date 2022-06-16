import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/categories_model.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

part 'kraud_fanding_state.dart';

class CrowdfundingCubit extends Cubit<CrowdfundingState> {

  static CrowdfundingCubit get to => GetIt.I<CrowdfundingCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<CrowdfundingCubit>(CrowdfundingCubit());
    CrowdfundingCubit.to.load();
  }
  CrowdfundingCubit() : super(CrowdfundingState());
  CrowdfundingService crowdfundingService = CrowdfundingService();

  Future load() async {
    var crowdfundingModel = await crowdfundingService.getCrowdfundingModel();
    var categories = await crowdfundingService.getCategoriesModel();
    var list= categories!.results![0];
    var tabProjects=await crowdfundingService.getProjectsById(list.children![0].id!);


    if (crowdfundingModel != null) {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(
        crowdfundingModel: crowdfundingModel,
        category: list.children,
        tabProjects: tabProjects
      ),
      );
      AppLoggerUtil.i(crowdfundingModel.count.toString());
    }
  }

  Future tabChange(int id) async{
    emit(state.copyWith(tabLoading: true));
    var tabProjects=await crowdfundingService.getProjectsById(id);

      if(tabProjects!=null){
        await Future.delayed(Duration(seconds: 1));
        emit(state.copyWith(tabProjects: tabProjects));
        emit(state.copyWith(tabLoading: false));
      }
  }
  void detailTabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}


