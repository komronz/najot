import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/model/question_model.dart';
import 'package:najot/data/services/project_data_service.dart';

import '../../model/comments_model.dart';

part 'project_data_state.dart';

class ProjectDataCubit extends Cubit<ProjectDataState> {
  ProjectDataCubit() : super(ProjectDataState());

    ProjectDataService projectDataService=ProjectDataService();

  Future load(int id ) async{
    var news= await projectDataService.getNewsById(id);
    var questions= await projectDataService.getQuestionsById(id);
    var comments = await projectDataService.getCommentsById(id);
    print(comments);
    if(news != null){
      emit(state.copyWith(newsData: news.results));
    }
    if(questions != null){
      emit(state.copyWith(questionsData: questions.results));
    }
    if(comments != null){
      print(comments.results);

      emit(state.copyWith(commentsData: comments.results));
    }
  }

  Future postCommitById(int id,String title,String content) async{
      var responseComments=await projectDataService.postCommentsBYId(id, content);
        print(responseComments);
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
