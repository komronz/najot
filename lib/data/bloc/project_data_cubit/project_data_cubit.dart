import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/model/question_model.dart';
import 'package:najot/data/services/project_data_service.dart';

import '../../model/comments_model.dart';
import '../../services/main_service.dart';

part 'project_data_state.dart';

class ProjectDataCubit extends Cubit<ProjectDataState> {
  ProjectDataCubit() : super(ProjectDataState());

    ProjectDataService projectDataService=ProjectDataService();
    var internetConnection;

  Future load(int id ) async{
    internetConnection = await MainService().checkInternetConnection();
    if(internetConnection){
      var news= await projectDataService.getNewsById(id);
      var questions= await projectDataService.getQuestionsById(id);
      var comments = await projectDataService.getCommentsById(id);
      if(news != null){
        emit(state.copyWith(newsData: news.results));
      }
      if(questions != null){
        emit(state.copyWith(questionsData: questions.results));
      }
      if(comments != null){

        emit(state.copyWith(commentsData: comments.results));
      }
    }else{

    }

  }

  Future connection()async{
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
  }

  Future postCommitById(int id,String title,String content) async{

        var responseComments=await projectDataService.postCommentsBYId(id,title, content);
        if(responseComments != null){
          print("success");
        }


  }

  Future postQuestion(int id,String title,String content) async{
      var responseQuestion=await projectDataService.postQuestionBYId(id, title, content);

      if(responseQuestion!= null){
        print("okey");
      }

    }


}
