import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/main_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static HomeCubit get to => GetIt.I<HomeCubit>();
  MainService mainService = MainService();

  static Future init() async {
    GetIt.instance..registerSingleton<HomeCubit>(HomeCubit());
    await GetIt.I<HomeCubit>().getModel();
  }

  HomeCubit() : super(HomeState());
  var internetConnection;
  Future getModel() async {
     internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection ));
    var mainModel = await mainService.getModel();
      if(mainModel!=null){
        emit(state.copyWith(
          categories: mainModel.categories,
          crudFunding: mainModel.crowdfunding,
          volunteer: mainModel.volunteering,
          charity: mainModel.charity,
          slider: mainModel.slider,
        ));

      }else{

      }


  }

      Future changeLike(int id) async{
        internetConnection = await MainService().checkInternetConnection();
        emit(state.copyWith(internetConnection: internetConnection));
          var changeLike= await mainService.changeLike(id);
          if(changeLike!=null){
            print(1);
            getModel();
          }
      }

}
