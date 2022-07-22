import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/favorite-add_service.dart';

part 'favorite_add_state.dart';

class FavoriteAddCubit extends Cubit<FavoriteAddState> {

  static FavoriteAddCubit get to => GetIt.I<FavoriteAddCubit>();
  FavoriteAddCubit() : super(FavoriteAddState());


  FavoriteAddService favoriteAddService = FavoriteAddService();

  static Future init() async {
    GetIt.instance..registerSingleton<FavoriteAddCubit>(FavoriteAddCubit());
  }

  Future getFavoriteAddList() async {
    emit(state.copyWith(hasLoading: true, hasError: false,));
    var favoriteAddAllModel = await favoriteAddService.getModel();
    if(favoriteAddAllModel!=null){
      emit(state.copyWith(hasLoading: false, list: favoriteAddAllModel.results));
      print(favoriteAddAllModel.results![0].type);
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,));
    }
  }
}
