import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/favorite-add_service.dart';
import 'package:najot/data/services/main_service.dart';

import '../../../ui/widgets/app_widgets.dart';

part 'favorite_add_state.dart';

class FavoriteAddCubit extends Cubit<FavoriteAddState> {

  static FavoriteAddCubit get to => GetIt.I<FavoriteAddCubit>();
  FavoriteAddCubit() : super(FavoriteAddState());


  FavoriteAddService favoriteAddService = FavoriteAddService();
  MainService mainService = MainService();

  static Future init() async {
    GetIt.instance..registerSingleton<FavoriteAddCubit>(FavoriteAddCubit());
  }

  Future getFavoriteAddList() async {
    var  internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(hasConnection: internetConnection));
    emit(state.copyWith(hasLoading: true, hasError: false,));
    var favoriteAddAllModel = await favoriteAddService.getModel();
    if(favoriteAddAllModel!=null){
      emit(state.copyWith(hasLoading: false, list: favoriteAddAllModel.results));
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,));
    }
  }

  Future deleteFavorite() async {
    var  internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(hasConnection: internetConnection));
    var favoriteAddAllModel = await favoriteAddService.getModel();
    if(favoriteAddAllModel!=null){
      emit(state.copyWith( list: favoriteAddAllModel.results));
      print(favoriteAddAllModel.results![0].type);
    }else{
      emit(state.copyWith( hasError: true,));
    }
  }

  Future changeLike(int id) async{
   var  internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
      var changeLike= await mainService.changeLike(id);
      if(changeLike!=null){
        deleteFavorite();
      }
    }else{
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }

  }
}
