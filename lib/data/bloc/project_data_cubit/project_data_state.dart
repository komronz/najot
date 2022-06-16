part of 'project_data_cubit.dart';


 class ProjectDataState  extends Equatable{

  ProjectDataState({this.newsModel});

  final NewsModel? newsModel;

  @override
  // TODO: implement props
  List<Object?> get props => [newsModel];


  ProjectDataState copyWith({
  NewsModel? newsModel
 }){
   return ProjectDataState(
    newsModel: newsModel ?? this.newsModel,
   );
  }
 }

