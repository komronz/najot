import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:get_it/get_it.dart';
import 'package:najot/data/services/about_service.dart';

import '../../model/about_model.dart';
import '../../model/product_model.dart';
import '../../services/main_service.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  static AboutCubit get to => GetIt.I<AboutCubit>();
  AboutCubit() : super(AboutState());

  AboutService aboutService = AboutService();
    var internetConnection;

  static Future init() async {
    GetIt.instance..registerSingleton<AboutCubit>(AboutCubit());
  }

  Future getAboutList() async {
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(hasConnection: internetConnection));
    emit(state.copyWith(hasLoading: true, hasError: false,));
    var aboutAllModel = await aboutService.getModel();
    if(aboutAllModel!=null){
      emit(state.copyWith(hasLoading: false, list: aboutAllModel.aboutModel));
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,));
    }
  }
}


