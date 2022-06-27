import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/services/project_data_service.dart';

part 'project_data_state.dart';

class ProjectDataCubit extends Cubit<ProjectDataState> {
  ProjectDataCubit() : super(ProjectDataState());

    ProjectDataService projectDataService=ProjectDataService();

  Future load(int id ) async{
    var news= await projectDataService.getNewsById(id);
    emit(state.copyWith(newsModel: news));

  }
}
