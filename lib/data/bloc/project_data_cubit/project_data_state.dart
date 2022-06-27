part of 'project_data_cubit.dart';

class ProjectDataState extends Equatable {
  ProjectDataState(
      {this.newsData = const [],
      this.questionsData = const [],
      this.commentsData = const [],
      this.errorQuestion = false,
      });

  final List<NewsData> newsData;
  final List<QuestionsData> questionsData;
  final List<CommentsData> commentsData;
  final bool errorQuestion;


  @override
  // TODO: implement props
  List<Object?> get props => [
        newsData,
        questionsData,
        commentsData,
        errorQuestion

      ];

  ProjectDataState copyWith({
    List<NewsData>? newsData,
    List<QuestionsData>? questionsData,
    List<CommentsData>? commentsData,
    bool? errorQuestion,
  }) {
    return ProjectDataState(
      newsData: newsData ?? this.newsData,
      questionsData: questionsData ?? this.questionsData,
      commentsData: commentsData ?? this.commentsData,
      errorQuestion: errorQuestion ?? this.errorQuestion,

    );
  }
}
