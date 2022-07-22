

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/comments_model.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/hive_service.dart';
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

  MyCrowdfundingSupportCubit()
      : super(MyCrowdfundingSupportState(
      widgetChange: false,
      isVisible: true
  ));
  Future load(int id)async{
    var news=await projectDataService.getNewsById(id);
    var getQuestion= await projectDataService.getQuestionsById(id);
    var getComments = await projectDataService.getCommentsById(id);

    if(news!=null){

      emit(state.copyWith(newsData: news.results));
    }
    if(getQuestion!=null){
      emit(state.copyWith(questionData: getQuestion.results));
    }

    if(getComments != null ){
      emit(state.copyWith(commentsData: getComments.results));
    }

  }


Future postCommentById(int id, String title,String content) async{
    var postComments= await projectDataService.postCommentsBYId(id,title, content);
    if(postComments !=null){
      print("vot eta da");
    }

}

  Future postAnswer(int id,String content) async{
    var postAnswer = await projectDataService.postAnswerBYId(id, content);

    if(postAnswer !=null){
    }
  }

  Future postNews(int id,String title,String comment, File image) async{
    print(HiveService.to.getToken());
    var postNews=await projectDataService.postNewsBYId(id, title,comment,image);
    if(postNews !=null){
      print("file posted");
    }

  }

  Future deletePost(int id,String content) async{
    var deletePost = await projectDataService.postDeleteBYId(id, content);

    if(deletePost != null){
      print("delete success");
    }

  }
  void saveFile(File file){
        emit(state.copyWith(file: file));
  }


  void widgetChange(bool v){
    emit(state.copyWith(widgetChange: v));
  }
  void isVisibleChange(bool v){
    emit(state.copyWith(isVisible: v));
  }
}
