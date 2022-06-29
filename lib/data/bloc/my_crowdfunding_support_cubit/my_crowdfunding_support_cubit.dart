

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/project_data_service.dart';

import 'my_crowdfunding_support_state.dart';


class MyCrowdfundingSupportCubit extends Cubit<MyCrowdfundingSupportState> {
  static MyCrowdfundingSupportCubit get to =>
      GetIt.I<MyCrowdfundingSupportCubit>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<MyCrowdfundingSupportCubit>(
          MyCrowdfundingSupportCubit());
  }
    ProjectDataService projectDataService=ProjectDataService();
  Future load(int id)async{
    var news=await projectDataService.getNewsById(id);
    var getQuestion= await projectDataService.getQuestionsById(id);

    if(news!=null){
      emit(state.copyWith(newsData: news.results));
    }
    if(getQuestion!=null){
      emit(state.copyWith(questionData: getQuestion.results));
    }

  }


  Future postNews(int id,String title,String comment, File image) async{
    var postNews=await projectDataService.postNewsBYId(id, title,comment,image);

    if(postNews !=null){

    }

  }
  MyCrowdfundingSupportCubit()
      : super(MyCrowdfundingSupportState(
          cardList: KraufandingModel.list,
          widgetChange: false,
          isVisible: true
        ));

  void widgetChange(bool v){
    emit(state.copyWith(widgetChange: v));
  }
  void isVisibleChange(bool v){
    emit(state.copyWith(isVisible: v));
  }
}
